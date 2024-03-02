# Rinha 2.0, exercício do Juliano

## Como inicializar e trabalhar

### Subir o banco
1.  ``` docker compose up```
### Popular banco
Rodar manualmente script de população em db-init.sql
### Subir a aplicação
1.  ```pip3 install virtualenv```
2.  ```virtualenv meuenv ```
3.  ```source meuenv/bin/activate```
4.  ```pip install -r requirements.txt```
5.  ```flask --debug --app rinha run```
### Rodar bateria de testes
```./testes.sh```
### Testar endpoints
#### Testar transações:
```clear; curl -s -X POST http://localhost:5000/clientes/1/transacoes -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }' -w "%{http_code}" | jq . ```
#### Testar o extrato:
```clear; code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo "resposta=$code" && cat body | jq . ```
## Comandos úteis

```psql -U root -h 127.0.0.1 -d rinhadb```
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
    code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo "resposta=$code" && cat body | jq . 
    métodos velhos:
      clear; curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" | jq . 
      alias e="clear; curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w \"%{http_code}\" | jq . "

Para ver se os códigos de erro no programa são únicos:
  cat rinha.py | grep -Eo -- '4[0-9]{2}' | sort


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
  - método extratos está listando os extratos na resposta por ordem do mais recente? 
  - método extratos está respondendo a quantidade de extratos; mas o conteúdo da resposta está correto? 
  - achar uma forma de, quando subir, popular o banco, ou o banco já estar populado.
  