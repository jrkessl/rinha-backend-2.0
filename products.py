# origem do tutorial: https://kinsta.com/blog/python-microservices/

import requests
import os
import sys
import json
from flask import Flask, jsonify
app = Flask(__name__)
port = int(os.environ.get('PORT', 5000))
if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=port)

# quando a request chama na raiz 
@app.route("/")
def home():
    return "Hello, this is a Flask Microservice"

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
    # dicts = [
    #     {'id': '2', 'name': 'POST aqui'}
    # ]
    # response_json = json.dumps(dicts)
    # return response_json, 200

    # Get data from request body
    data = request.get_json()  

    # Process data
    return jsonify(data), 201

# curl -X POST \
#   http://localhost:5000/products \
#   -H 'Content-Type: application/json' \
#   -d '{
#     "name": "Sample Product",
#     "price": 29.99
#   }'