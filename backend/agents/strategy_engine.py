from typing import Dict, Any
from ai.litellm_router import router

class StrategyAgent:
    def __init__(self, deployment_name: str = "trading-agent-nvidia"):
        self.deployment_name = deployment_name

    def _rule_based_fallback(self, analysis: Dict[str, Any], instrument_type: str) -> Dict[str, Any]:
        """Fallback logic if LLM is offline."""
        trend = analysis.get("trend", "Neutral")
        signal = analysis.get("signal_strength", "Hold")
        current_price = analysis.get("current_price", 100)

        strategy_name = "Hold/Wait"
        confidence = 50
        entry = current_price
        target = current_price * 1.05
        sl = current_price * 0.95
        rationale = "AI unavailable. Wait for clearer signals."

        if instrument_type == "Stocks":
            if signal in ["Buy", "Strong Buy"]:
                strategy_name = "Momentum Buy"
                confidence = 70
                entry = current_price
                target = analysis.get("resistance", current_price * 1.10)
                sl = analysis.get("support", current_price * 0.90)
                rationale = f"Rule-based momentum buy due to {trend} trend."
        elif instrument_type == "F&O":
            if trend == "Bullish":
                strategy_name = "Bull Call Spread"
                rationale = "Rule-based Bull Call Spread for defined risk bullish play."
            else:
                strategy_name = "Bear Put Spread"
                rationale = "Rule-based Bear Put Spread for defined risk bearish play."

        return {
            "strategy_name": strategy_name,
            "confidence_score": confidence,
            "entry_price": entry,
            "target_price": target,
            "stop_loss": sl,
            "rationale": rationale,
            "greeks": "N/A" if instrument_type != "F&O" else "Delta: ~0.3, Theta: negative, Vega: positive (estimates)",
            "provider": "Rule-based fallback — AI unavailable",
            "disclaimer": "AI-generated analysis only. Not SEBI-registered financial advice."
        }

    async def generate_strategy(self, ticker: str, instrument_type: str, analysis: Dict[str, Any], user_risk: str) -> Dict[str, Any]:
        if "error" in analysis:
            return {"error": analysis["error"]}

        system_prompt = "You are an expert trading strategy agent. If the user locale is Indian (hi/mr/te/gu/bn), you MUST respond in Hinglish (Hindi-English mix)."
        prompt = f"""
        Based on the following analysis for {ticker} ({instrument_type}), suggest the best strategy.
        User Risk Profile: {user_risk}
        Market Analysis: {analysis}

        Rules:
        - If F&O, explain Greeks (Delta, Theta, Vega) simply.
        - Output ONLY a JSON object with:
          "strategy_name" (str),
          "confidence_score" (int 0-100),
          "entry_price" (float),
          "target_price" (float),
          "stop_loss" (float),
          "rationale" (str),
          "greeks" (str, optional for non-F&O)
        """

        try:
            from main import AI_CONFIG
            cfg = AI_CONFIG["per_agent"].get("strategy", {})
            deployment = cfg.get("deployment_name", self.deployment_name)

            response = await router.acompletion(
                model=deployment,
                messages=[{"role": "system", "content": system_prompt}, {"role": "user", "content": prompt}],
                response_format={"type": "json_object"}
            )
            import json
            result = json.loads(response.choices[0].message.content)
            result["provider"] = response.model
            result["disclaimer"] = "AI-generated analysis only. Not SEBI-registered financial advice."
            return result
        except Exception as e:
            print(f"LLM failure in StrategyAgent: {e}")
            return self._rule_based_fallback(analysis, instrument_type)
