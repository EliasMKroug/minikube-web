# src/app.py
from flask import Flask, request
import requests
import os
from dotenv import load_dotenv
from pathlib import Path

load_dotenv(dotenv_path=Path(__file__).parent / ".env")  # 👈 Mejor práctica

app = Flask(__name__)

TELEGRAM_TOKEN = os.getenv("TELEGRAM_TOKEN")
TELEGRAM_CHAT_ID = os.getenv("TELEGRAM_CHAT_ID")

def send_telegram_message(message):
    url = f"https://api.telegram.org/bot{TELEGRAM_TOKEN}/sendMessage"
    payload = {
        "chat_id": TELEGRAM_CHAT_ID,
        "text": message,
        "parse_mode": "Markdown"
    }
    response = requests.post(url, json=payload)
    
        
    # 🚨 Agregamos logs
    print(f"[DEBUG] TOKEN: {TELEGRAM_TOKEN}")
    print(f"[DEBUG] CHAT_ID: {TELEGRAM_CHAT_ID}")
    #print(f"[DEBUG] Payload enviado: {payload}")
    #print(f"[DEBUG] Código de respuesta: {response.status_code}")
    #print(f"[DEBUG] Respuesta de Telegram: {response.text}")
    
    return response.status_code

@app.route('/alert', methods=['POST'])
def alert():
    data = request.json
    print(f"[DEBUG] grafana_json: {data}")
    if not data:
        return "No JSON received", 400

    alerts = data.get("alerts", [])
    for alert in alerts:
        name = alert.get("labels", {}).get("alertname", "NoName")
        status = alert.get("status", "unknown")
        summary = alert.get("annotations", {}).get("summary", "No summary")
        message = f"🚨 *Alerta Grafana*\n*Nombre:* {name}\n*Estado:* {status.upper()}\n*Resumen:* {summary}"
        send_telegram_message(message)

    return "Alert received", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
