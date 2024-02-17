#!/bin/bash 
set -e 

# precisa passar - caso comum 
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 1"
fi 

# precisa passar - caso comum, d
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 2"
fi 

# precisa falhar, transacao não é c nem d
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "x", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 3"
else
    echo "success"
fi 

# precisa falhar, transacao vazia 
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 4"
else
    echo "success"
fi 

# precisa falhar, transacao ausente
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 5"
else
    echo "success"
fi 

# precisa falhar, valor não pode ser zero 
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 0, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 6"
else
    echo "success"
fi 

# precisa falhar, valor não pode ser negativo
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": -1, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 7"
else
    echo "success"
fi 

# precisa falhar, valor não pode ser ausente
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": -1, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 8"
else
    echo "success"
fi 

# precisa falhar, valor não pode ser fração
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1.1, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 9"
else
    echo "success"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 10"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 11"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 12"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 13"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 14"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 15"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 16"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 16"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 17"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 18"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 19"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 20"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 21"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 22"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 23"
fi 

# precisa passar - descricao comprimento 1
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "a" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 24"
fi 

# precisa passar - descricao comprimento 10
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "zzzzzzzzzz" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success"
else
    echo "failure test 25"
fi 

# precisa falhar - descricao comprimento zero
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 26"
else
    echo "success"
fi 

# precisa falhar - descricao comprimento maior que dez
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "sssssssssss" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 27"
else
    echo "success"
fi 

# precisa falhar - descricao comprimento maior que dez (2)
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "ssssffffffffffffffffffffffsssssss" }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 28"
else
    echo "success"
fi 

# precisa falhar - descricao ausente
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")
echo $res
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure test 28"
else
    echo "success"
fi 
