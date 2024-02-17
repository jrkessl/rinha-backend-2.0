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
    return "Hello world"

@app.route('/clientes/<int:id>/transacoes', methods=['POST'])
def transacao(id):

    # Falta ver se os campos requeridos tem comprimento zero ou comprimento fora dos limites.

    # Get data from request body
    data = request.get_json()  
    print(f"Id={id}")

    # Get valor
    if "valor" in data:
        valor = data["valor"]
        if not isinstance(valor, int):
            print(f'Valor={valor} não é um número inteiro')
            return f'Valor={valor} não é um número inteiro.\n', 436
        if valor < 1:
            print(f'Valor={valor} precisa ser inteiro positivo.')
            return f'Valor={valor} precisa ser inteiro positivo.\n', 434
        print(f"Valor={valor}")
    else:
        print("Valor não fornecido")
        return f'Valor faltando\n', 432
    
    # Get tipo
    if "tipo" in data:
        tipo = data["tipo"]
        # Fail if tipo is not equal to 'c' neither 'd'
        if tipo != 'c' and tipo != 'd':
            print(f'Tipo={tipo} não é c ou d')
            return f'Tipo={tipo} não é c ou d.\n', 437
        print(f"Tipo={tipo}")
    else:
        print("Tipo não fornecido")
        return f'Tipo faltando\n', 433
    
    # Get descricao
    if "descricao" in data:
        descricao = data["descricao"]
        # Fail if the lenght of descricao is zero or more than 10
        if len(descricao) == 0 or len(descricao) > 10:
            print(f'Descricao={descricao} tem comprimento zero ou mais que 10')
            return f'Descricao={descricao} tem comprimento zero ou mais que 10.\n', 438
        print(f"Descricao={descricao}")
    else:
        print("Descricao não fornecida")
        return f'Descricao faltando\n', 435
        
    # valor = data["valor"]
    # tipo = data["tipo"]
    # descricao = data["descricao"]
    
    # The code must handle if the json variable does not contain a key "valorextra"
    # if not data["valorextra"]:
    #     print("valorextra não encontrado")  

    # if "valorextra" in data:
    #     valorextra = data["valorextra"]
    #     print(f"Valorextra={tipo_value}")
    # else:
    #     print("Valorextra nao fornecido")


    # valorextra = data["valorextra"]

    # print( f'Recebido id={id}\ntipo={tipo}\nvalor={valor}\ndescricao={descricao}\n' )
    # print(mesg)

    # Todos os campos são obrigatórios.
    # if not valor or not tipo or not descricao:
    #     return "Todos os campos são obrigatórios.", 400
    

    # return "Post " + id
    # ms="Posteee"+str(id)
    # print(ms)
    # return ms, 202
    return f'Recebido {id}, tipo {tipo}, valor {valor}, descricao {descricao}.\n', 201


    # # Compor resposta
    # dicts = [
    #     {'id': '2', 'name': 'Joaozinho'}
    # ]
    # response_json = json.dumps(dicts)
    # return response_json, 200


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

