#!/bin/bash

# Testar API de transações 
# precisa passar - caso comum 
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 1"
else
    echo "failure $res test 1"
fi 

# precisa passar - caso comum, d
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 2"
else
    echo "failure $res test 2"
fi 

# precisa falhar, transacao não é c nem d
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "x", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 3"
else
    echo "success $res test 3"
fi 

# precisa falhar, transacao vazia 
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "", "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 4"
else
    echo "success $res test 4"
fi 

# precisa falhar, transacao ausente
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "valor": 20, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 5"
else
    echo "success $res test 5"
fi 

# precisa falhar, valor não pode ser zero 
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 0, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 6"
else
    echo "success $res test 6"
fi 

# precisa falhar, valor não pode ser negativo
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": -1, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 7"
else
    echo "success $res test 7"
fi 

# precisa falhar, valor não pode ser ausente
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": -1, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 8"
else
    echo "success $res test 8"
fi 

# precisa falhar, valor não pode ser fração
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1.1, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 9"
else
    echo "success $res test 9"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 10"
else
    echo "failure $res test 10"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 11"
else
    echo "failure $res test 11"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 12"
else
    echo "failure $res test 12"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 13"
else
    echo "failure $res test 13"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 14"
else
    echo "failure $res test 14"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 15"
else
    echo "failure $res test 15"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 16"
else
    echo "failure $res test 16"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 16.5"
else
    echo "failure $res test 16.5"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 17"
else
    echo "failure $res test 17"
fi 
# exit 0

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 18"
else
    echo "failure $res test 18"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 19"
else
    echo "failure $res test 19"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 20"
else
    echo "failure $res test 20"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 100000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 21"
else
    echo "failure $res test 21"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 1000000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 22"
else
    echo "failure $res test 22"
fi 

# precisa passar, testando valores altos
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "c", "valor": 10000000000000000, "descricao": "abcd" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 23"
else
    echo "failure $res test 23"
fi 

# precisa passar - descricao comprimento 1
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "a" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 24"
else
    echo "failure $res test 24"
fi 

# precisa passar - descricao comprimento 10
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "zzzzzzzzzz" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "success $res test 25"
else
    echo "failure $res test 25"
fi 

# precisa falhar - descricao comprimento zero
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 26"
else
    echo "success $res test 26"
fi 

# precisa falhar - descricao comprimento maior que dez
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "sssssssssss" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 27"
else
    echo "success $res test 27"
fi 

# precisa falhar - descricao comprimento maior que dez (2)
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20, "descricao": "ssssffffffffffffffffffffffsssssss" }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 28"
else
    echo "success $res test 28"
fi 

# precisa falhar - descricao ausente
res=$(curl -X POST http://localhost:5000/clientes/3/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")

if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res test 28.5"
else
    echo "success $res test 28.5"
fi 

# precisa falhar - id não é inteiro positivo 
test=29
res=$(curl -X POST http://localhost:5000/clientes/0/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res, test $test"
else
    echo "success $res, test $test"
fi 

# precisa falhar - id não é inteiro positivo 
test=30
res=$(curl -X POST http://localhost:5000/clientes/-1/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res, test $test"
else
    echo "success $res, test $test"
fi 

# precisa falhar - id não é inteiro 
test=31
res=$(curl -X POST http://localhost:5000/clientes/3.1/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res, test $test"
else
    echo "success $res, test $test"
fi 

# precisa falhar - id não é inteiro 
test=32
res=$(curl -X POST http://localhost:5000/clientes/a/transacoes -H 'Content-Type: application/json' -d '{ "tipo": "d", "valor": 20 }' -s -o /dev/null -w "%{http_code}")
if [[ $res -gt 199 && $res -lt 300 ]]; then 
    echo "failure $res, test $test"
else
    echo "success $res, test $test"
fi 

