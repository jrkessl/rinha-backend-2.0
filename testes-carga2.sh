#!/bin/bash 
set -e 

# Essas variáveis precisam já estar setadas.
# endereco=localhost
# porta=9999
# quant (quantidade de testes).

BEGIN=$(date +%s) 

#### Transações:
#curl -s -X POST http://localhost:5000/clientes/1/transacoes -H 'Content-Type: application/json' -d '{"tipo": "d", "valor": 20, "descricao": "abcd" }' -w "%{http_code}" | jq . 

#### Extrato:
i=0
while [[ $i -lt $quant ]]; do 
    if [[ ! $(curl -s -X GET http://${endereco}:${porta}/clientes/1/extrato -H 'Content-Type: application/json' -w "%{http_code}" -o /tmp/body2) -eq 200 ]]; then 
        echo "Erro no teste número ${i}. Confira o resultado em /tmp/body2"
    fi 
    ((++i))
done 

echo "Realizados ${i} operações em $(($(date +%s)-$BEGIN))s" | tee /tmp/resultado2

exit 0 


