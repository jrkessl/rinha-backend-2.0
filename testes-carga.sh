#!/bin/bash 
set -e 

export endereco=localhost
export porta=9999
export quant=300

# Zerando os arquivos de resultado
rm /tmp/resultado1 || true  ; touch /tmp/resultado1
rm /tmp/resultado2 || true  ; touch /tmp/resultado2
rm /tmp/resultado3 || true  ; touch /tmp/resultado3

# Cronometrando 
BEGIN=$(date +%s) 

# Disparando os scripts de teste
./testes-carga1.sh & 
./testes-carga2.sh & 
./testes-carga3.sh & 

# Esperando pelas execuções
inotifywait /tmp/resultado1
if [[ $(cat /tmp/resultado2 | wc -l) -eq 0 ]]; then inotifywait /tmp/resultado2; fi 
if [[ $(cat /tmp/resultado3 | wc -l) -eq 0 ]]; then inotifywait /tmp/resultado3; fi 

# Sumarizando resultados
echo ""
echo "Testes totais realizados em $(($(date +%s)-$BEGIN))s"
echo ""
echo "Teste 1: $(cat /tmp/resultado1)"
echo "Teste 2: $(cat /tmp/resultado2)"
echo "Teste 3: $(cat /tmp/resultado3)"
