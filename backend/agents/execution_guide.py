from typing import Dict, Any
from ai.litellm_router import router

class ExecutionGuideAgent:
    def __init__(self, deployment_name: str = "trading-agent-local"):
        self.deployment_name = deployment_name

    def _rule_based_fallback(self, ticker: str, strategy: Dict[str, Any], risk: Dict[str, Any]) -> Dict[str, Any]:
        """Fallback logic if LLM is offline."""
        entry = strategy.get("entry_price", "market price")
        qty = risk.get("quantity", 1)
        sl = strategy.get("stop_loss", "defined level")

        steps = [
            f"1. Open Groww app and search for '{ticker}'.",
            f"2. Tap 'Buy'.",
            f"3. Select 'Limit Order' and set price to ₹{entry}.",
            f"4. Enter quantity: {qty}.",
            f"5. Add a Stop Loss trigger at ₹{sl}.",
            "6. Review your order and swipe to confirm."
        ]

        return {
            "instructions": steps,
            "provider": "Rule-based fallback — AI unavailable"
        }

    async def generate_guide(self, context: Dict[str, Any]) -> Dict[str, Any]:
        if "error" in context.get("strategy_output", {}):
            return {"error": "Cannot generate guide: invalid strategy."}

        system_prompt = "You are an execution guide agent. If the user locale is Indian (hi/mr/te/gu/bn), you MUST respond in Hinglish (Hindi-English mix)."
        prompt = f"""
        Create a step-by-step plain-language guide on how to execute this trade on the Groww app.
        Context:
        Ticker: {context.get('ticker')}
        Instrument: {context.get('instrument_type')}
        Strategy: {context.get('strategy_output')}
        Risk Details: {context.get('risk_output')}

        Output ONLY a JSON object with:
        "instructions" (a list of strings, each string is one step).
        """

        try:
            from main import AI_CONFIG
            cfg = AI_CONFIG["per_agent"].get("execution_guide", {})
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
            print(f"LLM failure in ExecutionGuideAgent: {e}")
            return self._rule_based_fallback(
                context.get("ticker", "Unknown"),
                context.get("strategy_output", {}),
                context.get("risk_output", {})
            )
