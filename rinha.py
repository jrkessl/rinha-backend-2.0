import requests
import os
import sys
import json
from flask import Flask, jsonify, request
import psycopg
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

    # Get data from request body
    data = request.get_json()  
    print(f"Id={id}")

    # 1) Tratamos todos os parâmetros da função
    # tratando id 
    if id < 1:
        print(f'Id={id} precisa ser inteiro positivo.')
        return f'Id={id} precisa ser inteiro positivo.\n', 439

    # tratando valor
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
    
    # tratando tipo
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
    
    # tratando descricao
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
        
    # 2) Pegar o saldo e limite do cliente 
    with psycopg.connect('postgresql://root:1234@localhost:5432/rinhadb', autocommit = False) as conn:
        with conn.cursor() as cur: # Open a cursor to perform database operations
            cur.execute("select saldo, limite from clientes where id = %s", (id,))
            if cur.rowcount == 0:
                print(f'Id={id} não localizado no banco.')
                return f'Id={id} não localizado no banco.\n', 441
            else:
                saldo, limite = cur.fetchone()
                print(f'Id={id} até então tem saldo {saldo}.')
            # cur.close()

    # 3) Testar consistência do saldo e limite do cliente
            if tipo == 'd':
                if saldo - valor < (limite * -1):
                    print(f'Limite excedido. Com débito de {valor}, novo saldo {saldo-valor} excederia limite atual de {limite}.')
                    dicts = [
                        {'erro': f'Limite excedido. Com débito de {valor}, novo saldo {saldo-valor} excederia limite atual de {limite}.\n' }
                    ]
                    response_json = json.dumps(dicts)
                    return response_json, 442

    # 4) Comittar a transação no banco 
            cur.execute(
                "insert into transacoes ( id, valor, tipo, description, realizada_em ) values ( %s, %s, %s, %s, CURRENT_TIMESTAMP )", 
                (id, valor, tipo, descricao))
            novosaldo=0
            if tipo == 'd':
                novosaldo = saldo - valor
            else:
                novosaldo = saldo + valor
            cur.execute("update clientes set saldo = %s where id = %s", (novosaldo, id))
            # print(f'cur.rowcount={cur.rowcount}')
            conn.commit()

            # return f'Transação inserida\n', 200

            # if cur.rowcount == 0:
            #     print(f'Id={id} não localizado no banco.')
            #     return f'Id={id} não localizado no banco.\n', 440
            # else:
            #     saldo, limite = cur.fetchone()
            #     print(f'Id={id} tem saldo {saldo}.')

    # Compor resposta
    dicts = [
        {'limite': limite, 'saldo': novosaldo}
    ]
    response_json = json.dumps(dicts)
    return response_json, 200

    # return f'Recebido {id}, tipo {tipo}, valor {valor}, descricao {descricao}.\n', 201

@app.route('/clientes/<int:id>/extrato', methods=['GET'])
def extrato(id):
    # Primeiro tratamos todos os parâmetros da função
    # tratando id 
    if id < 1:
        print(f'Id={id} precisa ser inteiro positivo.')
        return f'Id={id} precisa ser inteiro positivo.\n', 439

    # Processando a função
    # Connect to database
    print(1)
    with psycopg.connect('postgresql://root:1234@localhost:5432/rinhadb', autocommit = False) as conn:
        # Open a cursor to perform database operations
        print(2)
        with conn.cursor() as cur:
            # Query the database and obtain data as Python objects.
            print(3)
            cur.execute("select saldo, limite from clientes where id = %s", (id,))
            print(4)
            if cur.rowcount == 0:
                print(f'Id={id} não localizado no banco.')
                return f'Id={id} não localizado no banco.\n', 440
            else:
                saldo, limite = cur.fetchone()
                print(f'Id={id} tem saldo {saldo}.')

    # Só tá pegando o saldo. Precisa pegar as 10 últimas transações.
    
    # Compor resposta
    saldo = [
        {'total': saldo, 'data': 'aaaaa', 'limite': limite}
    ]
    transacao1 = [
        {'valor': '999', 'tipo': 'c', 'descricao': 'aaaaa', 'realizada_em': 'aaaaa'}
    ]
    final_dict = [
        saldo,
        transacao1
    ]
    response_json = json.dumps(final_dict)
    return response_json, 200

# # quando a request chama no caminho /products
# @app.route('/products', methods=['GET'])
# def get_products():

#     # Compor resposta
#     dicts = [
#         {'id': '2', 'name': 'Joaozinho'}
#     ]
#     response_json = json.dumps(dicts)
#     return response_json, 200

# @app.route('/products', methods=['POST'])
# def create_product():
#     print("hello world")

#     # Get data from request body
#     data = request.get_json()  

#     # Process data
#     return jsonify(data), 200

