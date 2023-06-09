#!/bin/bash
NUMEROS_PER_GENERAR=
if  [[ ${#} -eq 0 ]]
then
    NUMEROS_PER_GENERAR=10
elif [[ $[#] -eq 1 ]]
then
    NUMEROS_PER_GENERAR=${1}
fi


URL="https://www.random.org/integers/?num=${NUMEROS_PER_GENERAR}&min=1&max=100&col=1&base=10&format=plain&rnd=new"

SUMA=0
for NUMERO in $(curl ${URL}
do
    echo "el valor del número és ${NUMERO}"
    SUMA=$((SUMA+NUMERO))
done

echo "SUMA=${SUMA}"