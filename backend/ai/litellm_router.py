from litellm import Router
import os

def init_router():
    model_list = [
        {
            "model_name": "trading-agent-primary",
            "litellm_params": {
                "model": "gemini/gemini-1.5-pro",
                "api_key": os.getenv("GEMINI_API_KEY", "dummy"), # Needs real key to load
            },
        },
        {
            "model_name": "trading-agent-nvidia",
            "litellm_params": {
                "model": "openai/meta/llama-3.1-70b-instruct",
                "api_key": os.getenv("NVIDIA_API_KEY", "dummy"),
                "api_base": "https://integrate.api.nvidia.com/v1",
            },
        },
        {
            "model_name": "trading-agent-local",
            "litellm_params": {
                "model": "ollama/llama3",
                "api_base": os.getenv("OLLAMA_BASE_URL", "http://localhost:11434"),
            },
        },
    ]

    router = Router(
        model_list=model_list,
        fallbacks=[
            {"trading-agent-primary": ["trading-agent-nvidia", "trading-agent-local"]},
            {"trading-agent-nvidia": ["trading-agent-local"]},
        ],
        retry_on_failure=True,
        num_retries=2,
        timeout=30,
        allowed_fails=1,
    )
    return router

router = init_router()
