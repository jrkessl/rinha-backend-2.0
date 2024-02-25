#!/bin/bash
set -e

echo "Testando listagem de transações por cliente" 
export PGPASSWORD=1234

# deletar transações do usuário ID 1 
psql -U root -h 127.0.0.1 -d rinhadb <<EOF
delete from transacoes where id = 1;
EOF

# testar listagem de transações de usuário sem transações 
test=1
rm body || true 
code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo ""
quant=$(jq '.ultimas_transacoes | length' body)
if [[ $code -eq 200 && $quant -eq 0 ]]; then 
    echo "success test $test"
else
    echo "failure test $test"
fi 

# testar listagem de transações de usuário não-existente
test=2
rm body || true 
code=$(curl -s -X GET http://localhost:5000/clientes/6/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo ""
if [[ $code -eq 200 ]]; then 
    echo "failure test $test"
else
    echo "success test $test"
fi 

# adicionar uma transação no cliente 1 
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }'

# testar que o usuário 1 possui 1 transação 
test=3
rm body || true 
code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo ""
quant=$(jq '.ultimas_transacoes | length' body)
if [[ $code -eq 200 && $quant -eq 1 ]]; then 
    echo "success test $test"
else
    echo "failure test $test"
fi 

# adicionar mais transações no cliente 1, que vai ficar com um total de 3 
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 21, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 22, "descricao": "abcd" }'

# testar que o usuário 1 possui 3 transações
test=4
rm body || true 
code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo ""
quant=$(jq '.ultimas_transacoes | length' body)
if [[ $code -eq 200 && $quant -eq 3 ]]; then 
    echo "success test $test"
else
    echo "failure test $test"
fi 

# adicionar mais transações no cliente 1, que vai ficar com um total de 10
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 23, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 24, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 25, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 26, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 27, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 28, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 29, "descricao": "abcd" }'

# testar que o usuário 1 possui 10 transações
test=5
rm body || true 
code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo ""
quant=$(jq '.ultimas_transacoes | length' body)
if [[ $code -eq 200 && $quant -eq 10 ]]; then 
    echo "success test $test"
else
    echo "failure test $test"
fi 

# adicionar mais transações no cliente 1, que vai ficar com um total de 12
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 25, "descricao": "abcd" }'
curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 26, "descricao": "abcd" }'

# testar que o usuário 1 possui ainda apenas 10 transações
test=6
rm body || true 
code=$(curl -s -X GET http://localhost:5000/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o body) && echo ""
quant=$(jq '.ultimas_transacoes | length' body)
if [[ $code -eq 200 && $quant -eq 10 ]]; then 
    echo "success test $test"
else
    echo "failure test $test"
fi 

exit 0


============================================================================================================================================================
============================================================================================================================================================
============================================================================================================================================================
============================================================================================================================================================


curl -s -X POST http://localhost:5000/clientes/1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }'


exit 0 
rm body || true 


contar quantas transações existem no arquivo body:
jq '.ultimas_transacoes | length' body



res=$(curl -X POST http://localhost:5000/clientes/3.1/transacoes -o /dev/null -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res, test $test"
else
    echo "success $res, test $test"
fi 


psql -U root -h 127.0.0.1 -d rinhadb <<EOF
select id, saldo, limite from clientes;
EOF

