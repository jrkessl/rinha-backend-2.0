# origem do tutorial: https://kinsta.com/blog/python-microservices/

import requests
import os
import sys
import json
from flask import Flask, jsonify
app = Flask(__name__)
port = int(os.environ.get('PORT', 5000))

@app.route("/")
def home():
    return "Hello, this is a Flask Microservice"

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=port)

@app.route('/products', methods=['GET'])

def get_products():

    # Compor resposta
    dicts = [
        {'id': '2', 'name': 'Joaozinho'}
    ]
    response_json = json.dumps(dicts)
    return response_json, 200