import os
from flask import Flask, jsonify
from datetime import date

app = Flask(__name__)

@app.route("/", methods=["GET"])
def hello():
    today = date.today().strftime("%Y-%m-%d")
    return jsonify({
        "message": f"Hello world! Today is {today}"
    })

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok"}), 200

if __name__ == "__main__":
    port_env = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port_env)