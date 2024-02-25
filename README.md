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

testar transações:
    clear; curl -s -X POST http://localhost:5000/clientes/1/transacoes -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }' -w "%{http_code}" | jq . 

Testar o extrato: 
    clear; curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" | jq . 
    alias e="clear; curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w \"%{http_code}\" | jq . "



Considering this table:

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    saldo INTEGER NOT NULL DEFAULT 0,
    limite INTEGER NOT NULL DEFAULT 0
);

Write a SQL statement to run in a Postgresql database that will create a table like this:
table name: transacoes
column 1: name: "valor"; type: integer; no default value; cannot be null.
column 2: name: "tipo"; type: string, size 1 character; only "c" and "d" values will be accepted; no default value; cannot be null;
column 3: name: "description", type: string, size 10 characters; no default value;
column 4: name: "realizada_em", type: date. 
column 5: name: "id". This is a foreign key to table "clientes" on field "id". 

There should be indexes on columns "id" and "realizada_em". 

Features a adicionar:
  - achar uma forma de, quando subir, popular o banco, ou o banco já estar populado.
  - adotar um número para o saldo que seja maior do que integer.