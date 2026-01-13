from flask import Flask
import os

app = Flask(__name__)

MESSAGE = os.getenv("APP_MESSAGE", "Hello")
PORT = int(os.getenv("APP_PORT", 80))

@app.route("/")
def root():
    return MESSAGE

@app.route("/health")
def health():
    return {"status": "ok"}, 200

if _name_ == "__main__":
    app.run(host="0.0.0.0", port=PORT)
