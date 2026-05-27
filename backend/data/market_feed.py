import yfinance as yf
import pandas as pd
from typing import Dict, Any

def get_ohlcv(ticker: str, period: str = "1mo", interval: str = "1d") -> Dict[str, Any]:
    """
    Fetches OHLCV data for a given ticker.
    Supports NSE/BSE by appending .NS or .BO (e.g., RELIANCE.NS).
    """
    try:
        stock = yf.Ticker(ticker)
        hist = stock.history(period=period, interval=interval)

        if hist.empty:
            return {"error": f"No data found for {ticker}"}

        # Convert index to string for JSON serialization
        hist.index = hist.index.strftime('%Y-%m-%d')

        data = []
        for date, row in hist.iterrows():
            data.append({
                "date": date,
                "open": row["Open"],
                "high": row["High"],
                "low": row["Low"],
                "close": row["Close"],
                "volume": row["Volume"]
            })

        info = stock.info
        current_price = info.get("currentPrice", hist["Close"].iloc[-1])

        return {
            "ticker": ticker,
            "current_price": current_price,
            "period": period,
            "interval": interval,
            "data": data
        }
    except Exception as e:
        return {"error": str(e)}

# Add test endpoint in main.py temporarily to test this or test directly
if __name__ == "__main__":
    print(get_ohlcv("RELIANCE.NS", period="5d"))
