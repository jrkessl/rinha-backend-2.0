#!/bin/bash 
set -e 

# Primeiro, testar se a aplicação está ouvindo.
YES=0
nc localhost 5000 -w 2 || YES=1
if [[ $YES -eq 1 ]]; then
    echo "Aplicação não está ouvindo"
    exit 1
fi 

# Testar API de transações 
./teste-transacoes.sh