from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from dotenv import load_dotenv
import os
from typing import Dict, Any

from ai.provider_health import get_all_health
from ai.litellm_router import router as llm_router, init_router
from agents.pipeline import AgentPipeline

load_dotenv()

app = FastAPI(title="TradeMinds AI Backend")
pipeline = AgentPipeline()

# In-memory store for configuration
AI_CONFIG: Dict[str, Any] = {
    "global_provider": "gemini",
    "global_model": "gemini-1.5-pro",
    "per_agent": {
        "market_analyst": {"provider": "gemini", "model": "gemini-1.5-flash", "deployment_name": "trading-agent-primary"},
        "strategy": {"provider": "nvidia", "model": "meta/llama-3.1-70b-instruct", "deployment_name": "trading-agent-nvidia"},
        "risk": {"provider": "gemini", "model": "gemini-1.5-pro", "deployment_name": "trading-agent-primary"},
        "execution_guide": {"provider": "ollama", "model": "phi3:medium", "deployment_name": "trading-agent-local"},
        "portfolio_monitor": {"provider": "gemini", "model": "gemini-1.5-flash", "deployment_name": "trading-agent-primary"},
        "chat": {"provider": "auto", "model": "auto", "deployment_name": "trading-agent-primary"}
    }
}

def _provider_to_deployment(provider: str) -> str:
    if provider == "gemini":
        return "trading-agent-primary"
    elif provider == "nvidia":
        return "trading-agent-nvidia"
    elif provider == "ollama":
        return "trading-agent-local"
    return "trading-agent-primary"

@app.get("/health")
def health_check():
    return {"status": "online", "message": "TradeMinds AI Backend is running."}

@app.get("/api/ai/health")
async def get_ai_health():
    return await get_all_health()

@app.get("/api/ai/current-config")
def get_current_ai_config():
    return AI_CONFIG

class ProviderUpdate(BaseModel):
    provider: str
    model: str

@app.post("/api/ai/set-provider")
def set_provider(update: ProviderUpdate):
    AI_CONFIG["global_provider"] = update.provider
    AI_CONFIG["global_model"] = update.model
    # Dynamic update of per-agent routing
    for key in AI_CONFIG["per_agent"]:
        if update.provider == "auto":
            continue
        AI_CONFIG["per_agent"][key]["model"] = update.model
        AI_CONFIG["per_agent"][key]["provider"] = update.provider
        AI_CONFIG["per_agent"][key]["deployment_name"] = _provider_to_deployment(update.provider)

    return {"status": "success", "provider": update.provider, "model": update.model}

class AgentModelUpdate(BaseModel):
    agent: str
    provider: str
    model: str

@app.post("/api/ai/set-agent-model")
def set_agent_model(update: AgentModelUpdate):
    if update.agent not in AI_CONFIG["per_agent"]:
        AI_CONFIG["per_agent"][update.agent] = {}

    AI_CONFIG["per_agent"][update.agent] = {
        "provider": update.provider,
        "model": update.model,
        "deployment_name": _provider_to_deployment(update.provider)
    }
    return {"status": "success", "agent": update.agent, "provider": update.provider, "model": update.model}

class PipelineRequest(BaseModel):
    ticker: str
    instrument_type: str
    user_risk: str
    available_capital: float
    ohlcv_data: Dict[str, Any]

@app.post("/api/ai/analyze")
async def run_pipeline(req: PipelineRequest):
    return await pipeline.run_pipeline(
        req.ticker, req.instrument_type, req.user_risk, req.available_capital, req.ohlcv_data
    )
