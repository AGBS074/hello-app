from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify(message="Hello DevOps"), 200

@app.get("/healthz")
def health():
    return "ok", 200

if __name__ == "__main__":
    # Dev server (used only if you python app.py inside a container)
    app.run(host="0.0.0.0", port=8000)
