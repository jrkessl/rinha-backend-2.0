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
5.  ```flask --debug run```
### Rodar bateria de testes
```./testes.sh```
### Testar endpoints
#### Testar transações:
```clear; curl -s -X POST http://localhost:5000/clientes/1/transacoes -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }' -w "%{http_code}" | jq . ```
#### Testar o extrato:
```clear; code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo "resposta=$code" && cat body | jq . ```
## Configurando o nginx 
1. Instalar o gunicorn (ver arquivo requirements.txt)
2. Desabilitar o apache (se houver conflito de porta) ```sudo service apache2 stop```
3. Iniciar o gunicorn ```gunicorn --bind 0.0.0.0:8001 -w 1 'wsgi:app'```
4. Adicionar o bloco "server" na config do nxing ```/etc/nginx/nginx.conf``` aninhado dentro do bloco ```http```
```
	server {
		listen 6001;
		server_name _;

		location / {
			proxy_pass http://127.0.0.1:8001/;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header X-Forwarded-Proto $scheme;
			proxy_set_header X-Forwarded-Host $host;
			proxy_set_header X-Forwarded-Prefix /;
		}
	}	
```
5. Testar a config do nginx ```sudo nginx -t```
6. Talvez dar um reload no nginx ```sudo systemctl reload nginx```



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

Features a adicionar:
  - colocar tudo atrás de um servidor WSGI e proxy reverso
  - método extratos está listando os extratos na resposta por ordem do mais recente? 
  - método extratos está respondendo a quantidade de extratos; mas o conteúdo da resposta está correto? 
  - implementar o logger. https://flask.palletsprojects.com/en/3.0.x/quickstart/#logging
  
guia do indiano:
  iniciar o gunicorn:
    gunicorn --bind 0.0.0.0:5001 wsgi:app
  iniciar o gunicorn com o bind do diretório:
    gunicorn --workers 3 --bind unix:/home/juliano/Documents/github/rinhabackend2.0.sock -m 777 wsgi:app

guia do flask mesmo:
  iniciar o gunicorn:
    gunicorn -w 1 'wsgi:app'

ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/  
sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/
sudo nginx -t

