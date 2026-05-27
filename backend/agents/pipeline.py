from typing import Dict, Any
from agents.market_analyst import MarketAnalystAgent
from agents.strategy_engine import StrategyAgent
from agents.risk_agent import RiskAgent
from agents.execution_guide import ExecutionGuideAgent

class AgentPipeline:
    def __init__(self):
        self.market_analyst = MarketAnalystAgent()
        self.strategy_agent = StrategyAgent()
        self.risk_agent = RiskAgent()
        self.execution_guide = ExecutionGuideAgent()

    async def run_pipeline(self, ticker: str, instrument_type: str, user_risk: str, available_capital: float, ohlcv_data: Dict[str, Any]) -> Dict[str, Any]:
        """
        Runs the full AI Agent Pipeline:
        MarketAnalyst -> Strategy -> Risk -> ExecutionGuide
        """

        # 1. Market Analysis
        analysis_result = await self.market_analyst.analyze(ticker, ohlcv_data)
        if "error" in analysis_result:
            return {"error": f"Analysis failed: {analysis_result['error']}"}

        # 2. Strategy Engine
        strategy_result = await self.strategy_agent.generate_strategy(ticker, instrument_type, analysis_result, user_risk)
        if "error" in strategy_result:
            return {"error": f"Strategy failed: {strategy_result['error']}"}

        # 3. Risk Management
        risk_result = await self.risk_agent.calculate_risk(strategy_result, available_capital)
        if "error" in risk_result:
            return {"error": f"Risk calculation failed: {risk_result['error']}"}

        # 4. Execution Guide
        context = {
            "ticker": ticker,
            "instrument_type": instrument_type,
            "strategy_output": strategy_result,
            "risk_output": risk_result
        }
        guide_result = await self.execution_guide.generate_guide(context)

        return {
            "ticker": ticker,
            "instrument_type": instrument_type,
            "analysis": analysis_result,
            "strategy": strategy_result,
            "risk": risk_result,
            "execution_guide": guide_result,
        }
