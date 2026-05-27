import httpx
import os
import time
from typing import Dict, Any

async def check_gemini() -> Dict[str, Any]:
    api_key = os.getenv("GEMINI_API_KEY")
    if not api_key or api_key == "dummy":
        return {"status": "offline", "latency_ms": 0, "models": []}

    start_time = time.time()
    try:
        async with httpx.AsyncClient() as client:
            # Note: This is a simplistic health check, in reality we'd hit the models endpoint
            url = f"https://generativelanguage.googleapis.com/v1beta/models?key={api_key}"
            response = await client.get(url, timeout=5.0)
            latency = int((time.time() - start_time) * 1000)
            if response.status_code == 200:
                data = response.json()
                models = [m["name"].replace("models/", "gemini/") for m in data.get("models", []) if "gemini" in m["name"]]
                return {"status": "online", "latency_ms": latency, "models": models}
    except Exception:
        pass

    return {"status": "offline", "latency_ms": 0, "models": []}

async def check_nvidia() -> Dict[str, Any]:
    api_key = os.getenv("NVIDIA_API_KEY")
    if not api_key or api_key == "dummy":
        return {"status": "offline", "latency_ms": 0, "models": []}

    start_time = time.time()
    try:
        async with httpx.AsyncClient() as client:
            headers = {"Authorization": f"Bearer {api_key}"}
            url = "https://integrate.api.nvidia.com/v1/models"
            response = await client.get(url, headers=headers, timeout=5.0)
            latency = int((time.time() - start_time) * 1000)
            if response.status_code == 200:
                data = response.json()
                models = [f"openai/{m['id']}" for m in data.get("data", [])]
                return {"status": "online", "latency_ms": latency, "models": models}
    except Exception:
        pass

    return {"status": "offline", "latency_ms": 0, "models": []}

async def check_ollama() -> Dict[str, Any]:
    base_url = os.getenv("OLLAMA_BASE_URL", "http://localhost:11434")
    start_time = time.time()
    try:
        async with httpx.AsyncClient() as client:
            url = f"{base_url}/api/tags"
            response = await client.get(url, timeout=3.0)
            latency = int((time.time() - start_time) * 1000)
            if response.status_code == 200:
                data = response.json()
                models = [f"ollama/{m['name']}" for m in data.get("models", [])]
                return {"status": "online", "latency_ms": latency, "models": models}
    except Exception:
        pass

    return {"status": "offline", "latency_ms": 0, "models": []}

async def get_all_health() -> Dict[str, Dict[str, Any]]:
    import asyncio
    gemini, nvidia, ollama = await asyncio.gather(
        check_gemini(),
        check_nvidia(),
        check_ollama()
    )
    return {
        "gemini": gemini,
        "nvidia": nvidia,
        "ollama": ollama
    }
