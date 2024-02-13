import requests
import os
from flask import Flask, jsonify
app = Flask(__name__)
port = int(os.environ.get('PORT', 5000))


BASE_URL = "https://127.0.0.1"
response = requests.get(f"{BASE_URL}/products")
# print(response.status_code)
# print (response)

    # if response.status_code != 200:
    #     return jsonify({'error': response.json()['message']}), response.status_code
    # products = []
    # for product in response.json()['products']:
    #     product_data = {
    #         'id': product['id'],
    #         'title': product['title'],
    #         'brand': product['brand'],
    #         'price': product['price'],
    #         'description': product['description']
    #     }
    #     products.append(product_data)
    # return jsonify({'data': products}), 200 if products else 204    

