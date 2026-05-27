from typing import Dict, Any
from ai.litellm_router import router

class RiskAgent:
    def __init__(self, deployment_name: str = "trading-agent-primary"):
        self.deployment_name = deployment_name

    def _rule_based_fallback(self, strategy: Dict[str, Any], capital: float) -> Dict[str, Any]:
        """Fallback logic if LLM is offline: default 1% capital risk rule."""
        entry = strategy.get("entry_price", 1)
        sl = strategy.get("stop_loss", entry * 0.95)
        target = strategy.get("target_price", entry * 1.05)

        # Risk per share
        risk_per_share = entry - sl
        if risk_per_share <= 0:
            risk_per_share = entry * 0.01  # Default 1% if SL is invalid

        # 1% of total capital
        max_loss_inr = capital * 0.01

        # Calculate quantity
        quantity = int(max_loss_inr / risk_per_share)

        # Deploy capital
        deploy_capital = quantity * entry

        # Risk Reward
        reward_per_share = target - entry
        rr_ratio = reward_per_share / risk_per_share if risk_per_share > 0 else 0

        return {
            "deploy_capital_inr": deploy_capital,
            "quantity": quantity,
            "risk_reward_ratio": round(rr_ratio, 2),
            "max_loss_inr": max_loss_inr,
            "max_loss_percent": 1.0,
            "provider": "Rule-based fallback — AI unavailable"
        }

    async def calculate_risk(self, strategy: Dict[str, Any], available_capital: float) -> Dict[str, Any]:
        if "error" in strategy:
            return {"error": strategy["error"]}

        system_prompt = "You are a risk management agent. If the user locale is Indian (hi/mr/te/gu/bn), you MUST respond in Hinglish (Hindi-English mix)."
        prompt = f"""
        Based on the following strategy and available capital (₹{available_capital}), calculate the optimal position size.
        Strategy: {strategy}

        Use the Kelly Criterion or a fixed fractional method.
        Output ONLY a JSON object with:
        "deploy_capital_inr" (float),
        "quantity" (int),
        "risk_reward_ratio" (float),
        "max_loss_inr" (float),
        "max_loss_percent" (float)
        """

        try:
            from main import AI_CONFIG
            cfg = AI_CONFIG["per_agent"].get("risk", {})
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
            print(f"LLM failure in RiskAgent: {e}")
            return self._rule_based_fallback(strategy, available_capital)
