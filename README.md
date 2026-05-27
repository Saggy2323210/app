# TradeMinds AI

Build a cross-platform Flutter application (Android + Windows/macOS Desktop) called TradeMinds AI — an AI-powered personal trading assistant and portfolio monitor.

## Flutter Setup

1. Make sure Flutter SDK is installed and on your path.
2. Run `flutter pub get`
3. Run `dart run build_runner build` to generate the Isar database schemas.
4. Run `flutter run`

## Python Backend Setup

1. Install Python 3.10+
2. Navigate to the `backend` directory.
3. Install dependencies: `pip install -r requirements.txt` (TA-Lib needs system bindings installed first depending on OS).
4. Copy `.env.example` to `.env` and fill in your API keys (Gemini, NVIDIA, etc.)
5. Run the server: `uvicorn main:app --reload`
6. API will be available at `http://127.0.0.1:8000`

### API Keys
- Gemini API key: Get it from [aistudio.google.com](https://aistudio.google.com)
- NVIDIA NIM API key: Get it from [build.nvidia.com](https://build.nvidia.com)
- Ollama: Install from [ollama.com](https://ollama.com) and pull models like `phi3:medium` via `ollama run phi3:medium`.
