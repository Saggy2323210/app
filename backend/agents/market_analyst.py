import pandas as pd
import numpy as np
import talib
from typing import Dict, Any
from ai.litellm_router import router

class MarketAnalystAgent:
    def __init__(self, deployment_name: str = "trading-agent-primary"):
        self.deployment_name = deployment_name

    def compute_indicators(self, df: pd.DataFrame) -> Dict[str, Any]:
        """Computes RSI, MACD, Bollinger Bands, and EMA."""
        if df.empty or len(df) < 50:
            return {"error": "Not enough data to compute indicators (need at least 50 periods)."}

        close = df['close'].values

        # RSI
        rsi = talib.RSI(close, timeperiod=14)

        # MACD
        macd, macdsignal, macdhist = talib.MACD(close, fastperiod=12, slowperiod=26, signalperiod=9)

        # Bollinger Bands
        upper, middle, lower = talib.BBANDS(close, timeperiod=20, nbdevup=2, nbdevdn=2, matype=0)

        # EMA
        ema9 = talib.EMA(close, timeperiod=9)
        ema21 = talib.EMA(close, timeperiod=21)
        ema50 = talib.EMA(close, timeperiod=50)

        current_idx = -1

        return {
            "rsi": rsi[current_idx] if not np.isnan(rsi[current_idx]) else None,
            "macd": macd[current_idx] if not np.isnan(macd[current_idx]) else None,
            "macd_signal": macdsignal[current_idx] if not np.isnan(macdsignal[current_idx]) else None,
            "bb_upper": upper[current_idx] if not np.isnan(upper[current_idx]) else None,
            "bb_lower": lower[current_idx] if not np.isnan(lower[current_idx]) else None,
            "ema9": ema9[current_idx] if not np.isnan(ema9[current_idx]) else None,
            "ema21": ema21[current_idx] if not np.isnan(ema21[current_idx]) else None,
            "ema50": ema50[current_idx] if not np.isnan(ema50[current_idx]) else None,
            "current_price": close[current_idx]
        }

    def _rule_based_fallback(self, ind: Dict[str, Any]) -> Dict[str, Any]:
        """Fallback logic if LLM is offline."""
        rsi = ind.get("rsi", 50)
        macd = ind.get("macd", 0)
        macd_signal = ind.get("macd_signal", 0)
        current = ind.get("current_price", 0)
        ema50 = ind.get("ema50", current)

        trend = "Neutral"
        signal = "Hold"
        momentum = 50

        if current > ema50:
            trend = "Bullish"
            if rsi < 30:
                signal = "Buy"
                momentum = 80
            elif rsi > 70:
                signal = "Take Profit"
                momentum = 20
        else:
            trend = "Bearish"
            if rsi > 70:
                signal = "Sell/Short"
                momentum = 20
            elif rsi < 30:
                signal = "Cover Short"
                momentum = 80

        if macd > macd_signal and trend == "Bullish":
            momentum = min(100, momentum + 10)

        return {
            "trend": trend,
            "support": ind.get("bb_lower"),
            "resistance": ind.get("bb_upper"),
            "momentum_score": momentum,
            "signal_strength": signal,
            "provider": "Rule-based fallback — AI unavailable"
        }

    async def analyze(self, ticker: str, ohlcv_data: Dict[str, Any]) -> Dict[str, Any]:
        if "error" in ohlcv_data:
            return {"error": ohlcv_data["error"]}

        df = pd.DataFrame(ohlcv_data["data"])
        indicators = self.compute_indicators(df)

        if "error" in indicators:
            return indicators

        system_prompt = "You are a highly skilled market analyst agent. If the user locale is Indian (hi/mr/te/gu/bn), you MUST respond in Hinglish (Hindi-English mix)."
        prompt = f"""
        Analyze the following technical indicators for {ticker}.
        Current Price: {indicators['current_price']}
        RSI (14): {indicators['rsi']}
        MACD: {indicators['macd']}, Signal: {indicators['macd_signal']}
        EMA 9/21/50: {indicators['ema9']} / {indicators['ema21']} / {indicators['ema50']}
        Bollinger Bands Upper/Lower: {indicators['bb_upper']} / {indicators['bb_lower']}

        Based on this data, output ONLY a JSON object with exactly these keys:
        - "trend": "Bullish", "Bearish", or "Neutral"
        - "support": a number representing the nearest strong support level
        - "resistance": a number representing the nearest strong resistance level
        - "momentum_score": an integer 0-100 indicating momentum strength
        - "signal_strength": "Strong Buy", "Buy", "Hold", "Sell", or "Strong Sell"
        """

        try:
            from main import AI_CONFIG
            cfg = AI_CONFIG["per_agent"].get("market_analyst", {})
            deployment = cfg.get("deployment_name", self.deployment_name)

            response = await router.acompletion(
                model=deployment,
                messages=[{"role": "system", "content": system_prompt}, {"role": "user", "content": prompt}],
                response_format={"type": "json_object"}
            )
            import json
            result = json.loads(response.choices[0].message.content)
            result["provider"] = response.model
            return result
        except Exception as e:
            print(f"LLM failure in MarketAnalyst: {e}")
            return self._rule_based_fallback(indicators)
