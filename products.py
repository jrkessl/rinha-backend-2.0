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

BASE_URL = "https://dummyjson.com"
@app.route('/products', methods=['GET'])
def get_products():
    print(1)
    response = requests.get(f"{BASE_URL}/products")
    print(2)
    print("resposta é " + str(response.status_code))

    dicts = [
        {'id': '2', 'name': 'Joaozinho'}
    ]
    updated_json = json.dumps(dicts)

    print(updated_json)


    #json_string = '{"id": 1, "name": "Joaozinho"}' # cria string com json básico
    #data = json.loads(json_string) # carrega a string no dicionário
    #data["id"] = str(response.status_code) # atualiza valor 
    #updated_json = json.dumps(data) # converte o dicionário para string

    return updated_json, response.status_code
    sys.exit()

    # string básica 
    # json_string = """
    # {
    # "id": 1, 
    # "name": "Test User"
    # }
    # """

    if response.status_code != 200:
        return jsonify({'error': response.json()['message']}), response.status_code
    print(3)
    # products = []
    # for product in response.json()['products']:
    #     print(4)
    #     product_data = {
    #         'id': product['id'],
    #         'title': product['title'],
    #         'brand': product['brand'],
    #         'price': product['price'],
    #         'description': product['description']
    #     }
    #     products.append(product_data)
    print(5)
    return jsonify({ "resposta": 1, "name": "Test User" }), 200 if products else 204    




    return jsonify({'data': products}), 200 if products else 204    

