Comandos:
- pip3 install virtualenv
- virtualenv meuenv
- source meuenv/bin/activate
- pip install -r requirements.txt
Então, executar o servidor:
- ```flask --debug --app rinha run```, onde "products" é o nome do arquivo .py.# rinha-backend-2.0



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
    "valor": 20,
    "descricao": "abcd"
  }' -w "%{http_code}"
