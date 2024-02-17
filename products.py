# origem do tutorial: https://kinsta.com/blog/python-microservices/

import requests
import os
import sys
import json
from flask import Flask, jsonify, request
app = Flask(__name__)
port = int(os.environ.get('PORT', 5000))
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=port)

# quando a request chama na raiz 
@app.route("/")
def home():
    return "Hello world2"

# quando a request chama no caminho /products
@app.route('/products', methods=['GET'])
def get_products():

    # Compor resposta
    dicts = [
        {'id': '2', 'name': 'Joaozinho'}
    ]
    response_json = json.dumps(dicts)
    return response_json, 200

@app.route('/products', methods=['POST'])
def create_product():
    print("hello world")

    # Get data from request body
    data = request.get_json()  

    # Process data
    return jsonify(data), 200

