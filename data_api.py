import yfinance as yf
import pandas as pd
import numpy as np
import ta  # Pour les indicateurs techniques
import requests

# -------------------- 1️⃣ Extraction des données de l'or --------------------
def get_gold_data(start_date="2004-01-01", end_date="2024-01-01", interval="1d"):
    """Télécharge les données historiques de l'or (XAU/USD)"""
    gold = yf.download("GC=F", start=start_date, end=end_date, interval=interval)
    gold.dropna(inplace=True)  # Supprime les valeurs manquantes
    return gold

# -------------------- 2️⃣ Calcul des indicateurs techniques --------------------
def add_technical_indicators(df):
    """Ajoute les indicateurs techniques aux données de l'or"""

    df['MA50'] = df['Close'].rolling(window=50).mean()  # Moyenne Mobile 50 jours
    df['MA200'] = df['Close'].rolling(window=200).mean()  # Moyenne Mobile 200 jours

    # RSI (Relative Strength Index)
    df['RSI'] = ta.momentum.RSIIndicator(df['Close'].squeeze(), window=14).rsi()

    # MACD (Moving Average Convergence Divergence)
    macd = ta.trend.MACD(df['Close'].squeeze())
    df['MACD'] = macd.macd()

    # Bandes de Bollinger
    bb = ta.volatility.BollingerBands(df['Close'].squeeze())
    df['BB_High'] = bb.bollinger_hband()
    df['BB_Low'] = bb.bollinger_lband()

    return df


# -------------------- 3️⃣ Extraction des données macroéconomiques --------------------
def get_macro_data():
    """Récupère les données macroéconomiques depuis une API publique"""
    macro_data = {}

    # 🔹 API de la Fed pour le taux d'intérêt US
    fed_api_url = "https://api.stlouisfed.org/fred/series/observations"
    params = {
        "series_id": "FEDFUNDS",  # Taux d'intérêt de la Fed
        "api_key": "YOUR_API_KEY",  # Remplace par une clé API gratuite
        "file_type": "json"
    }
    response = requests.get(fed_api_url, params=params)
    if response.status_code == 200:
        data = response.json()
        macro_data["Taux_Interet"] = float(data['observations'][-1]['value'])  # Dernier taux disponible

    # 🔹 API pour l'inflation US (CPI)
    inflation_url = "https://api.stlouisfed.org/fred/series/observations"
    params["series_id"] = "CPIAUCSL"  # Indice des prix à la consommation (inflation)
    response = requests.get(inflation_url, params=params)
    if response.status_code == 200:
        data = response.json()
        macro_data["Inflation"] = float(data['observations'][-1]['value'])  # Dernier CPI disponible

    return macro_data

# -------------------- 4️⃣ Fusion des données et exportation --------------------
def main():
    print("📥 Téléchargement des données de l'or...")
    gold_data = get_gold_data()

    print("📊 Ajout des indicateurs techniques...")
    gold_data = add_technical_indicators(gold_data)

    print("🌍 Récupération des données macroéconomiques...")
    macro_data = get_macro_data()
    
    # Ajout des variables macroéconomiques sous forme de colonnes constantes
    for key, value in macro_data.items():
        gold_data[key] = value

    # Enregistrement des données dans un fichier CSV
    gold_data.to_csv("gold_data_complete.csv")
    print("✅ Données enregistrées dans 'gold_data_complete.csv'")

if __name__ == "__main__":
    main()
