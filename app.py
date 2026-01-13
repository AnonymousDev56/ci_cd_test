from flask import Flask
import os

app = Flask(_name_)

MESSAGE = os.getenv("APP_MESSAGE", "Hello")
PORT = int(os.getenv("APP_PORT", 80))

@app.route("/")
def root():
    return MESSAGE

@app.route("/health")
def health():
    return {"status": "ok"}, 200

if _name_ == "_main_":
    app.run(host="0.0.0.0", port=PORT)
