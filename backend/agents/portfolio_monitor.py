from typing import Dict, Any, List
from ai.litellm_router import router
from apscheduler.schedulers.background import BackgroundScheduler
import asyncio

class PortfolioMonitorAgent:
    def __init__(self, deployment_name: str = "trading-agent-primary"):
        self.deployment_name = deployment_name
        self.scheduler = BackgroundScheduler()
        self.holdings = []

    def start(self):
        # Run every 15 minutes
        self.scheduler.add_job(self._check_portfolio_job, 'interval', minutes=15)
        self.scheduler.start()

    def _rule_based_check(self, holdings: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Fallback: Price-rule checks without LLM."""
        alerts = []
        for h in holdings:
            current = h.get("current_price", 0)
            target = h.get("target_price", 0)
            sl = h.get("stop_loss", 0)

            if target > 0 and current >= target:
                alerts.append({
                    "ticker": h.get("ticker"),
                    "alert_type": "Target Reached",
                    "action": "Sell/Take Profit",
                    "reason": f"Price reached target of {target}",
                    "provider": "Rule-based fallback"
                })
            elif sl > 0 and current <= sl:
                alerts.append({
                    "ticker": h.get("ticker"),
                    "alert_type": "Stop Loss Hit",
                    "action": "Sell/Cut Loss",
                    "reason": f"Price dropped below stop loss of {sl}",
                    "provider": "Rule-based fallback"
                })
        return alerts

    async def analyze_portfolio(self, portfolio_data: Dict[str, Any]) -> Dict[str, Any]:
        holdings = portfolio_data.get("holdings", [])

        system_prompt = "You are a portfolio monitor agent. If the user locale is Indian (hi/mr/te/gu/bn), you MUST respond in Hinglish (Hindi-English mix)."
        prompt = f"""
        Review the current portfolio and alert on critical conditions.
        Holdings: {holdings}

        Check for: Stop-loss hits, Target reaches, Sector overexposure (>30%), F&O margin >70%.
        Output ONLY a JSON object with:
        "alerts" (list of objects with keys: "ticker", "alert_type", "action", "reason").
        """

        try:
            from main import AI_CONFIG
            cfg = AI_CONFIG["per_agent"].get("portfolio_monitor", {})
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
            print(f"LLM failure in PortfolioMonitor: {e}")
            return {"alerts": self._rule_based_check(holdings), "provider": "Rule-based fallback"}

    def _check_portfolio_job(self):
        """Job triggered by APScheduler."""
        try:
            loop = asyncio.get_event_loop()
        except RuntimeError:
            loop = asyncio.new_event_loop()
            asyncio.set_event_loop(loop)

        mock_data = {"holdings": self.holdings}
        result = loop.run_until_complete(self.analyze_portfolio(mock_data))
        print(f"Portfolio Monitor alerts: {result}")
