Lançar o ambiente de teste:
    $ pip3 install virtualenv
    $ virtualenv meuenv
    $ source meuenv/bin/activate
    $ pip install -r requirements.txt
    Então, executar o servidor:
    $ flask --debug --app rinha run

Lançar o banco: 
    $ docker-compose up
    $ psql -U root -h 127.0.0.1 -d rinhadb

Testar a aplicação local: 

curl -X POST \
  http://localhost:5000/products \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Sample Product",
    "price": 29.99
  }' -w "%{http_code}"

curl -X POST \
  http://localhost:5000/clientes/3/transacoes \
  -H 'Content-Type: application/json' \
  -d '{
    "tipo": "d",
    "valor": 20.1,
    "descricao": "abcd"
  }' -w "%{http_code}"


clear; curl -X POST http://localhost:5000/clientes/1/transacoes -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }' -w "%{http_code}"

clear; curl -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}"

