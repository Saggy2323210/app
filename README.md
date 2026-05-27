# TradeMinds AI

Build a cross-platform Flutter application (Android + Windows/macOS Desktop) called TradeMinds AI — an AI-powered personal trading assistant and portfolio monitor.

## Setup Instructions

### Backend (Python FastAPI)
1. Install Python 3.10+
2. Navigate to `backend/` directory: `cd backend`
3. Because the codebase uses TA-Lib for indicator calculations, you must install the TA-Lib C library on your system first:
    - **macOS:** `brew install ta-lib`
    - **Linux:** Download `ta-lib-0.4.0-src.tar.gz`, `./configure --prefix=/usr`, `make`, `sudo make install`.
    - **Windows:** Download the unofficial pre-compiled wheel for your python version.
4. Install python requirements: `pip install -r requirements.txt`
5. Copy `.env.example` to `.env` and fill in:
    - `GEMINI_API_KEY`: Get from [aistudio.google.com](https://aistudio.google.com)
    - `NVIDIA_API_KEY`: Get from [build.nvidia.com](https://build.nvidia.com)
6. Start Ollama and run `ollama pull phi3:medium` to ensure the local agent functions.
7. Run the FastAPI server: `uvicorn main:app --reload`
    - API runs on `http://127.0.0.1:8000`

### Frontend (Flutter)
1. Install Flutter SDK (3.x)
2. In the project root, run `flutter pub get`
3. Run `dart run build_runner build` to generate the Isar database schemas.
4. Run the app: `flutter run`
