#!/bin/bash
NUMEROS_PER_GENERAR=0
if  [[ ${#} -eq 0 ]]
then
    NUMEROS_PER_GENERAR=10
elif [[ ${#} -eq 1 ]]
then
    NUMEROS_PER_GENERAR=${1}
fi


URL="https://www.random.org/integers/?num=${NUMEROS_PER_GENERAR}&min=1&max=100&col=1&base=10&format=plain&rnd=new"

SUMA=0
MINIM=101
MAXIM=0
for NUMERO in $(curl ${URL})
do
    echo "el valor del número és ${NUMERO}"
    SUMA=$((SUMA+NUMERO))
    #Calcul del mínim
    if [[ ${NUMERO} -lt ${MINIM} ]]
    then
        MINIM=${NUMERO}
    fi
    #Calcul del màxim
     if [[ ${NUMERO} -gt ${MAXIM} ]]
    then
        MAXIM=${NUMERO}
    fi
    #Calcul de mitjana
done

MITJANA=$(echo "scale=3; ${SUMA}/${NUMEROS_PER_GENERAR}" | bc)

echo "SUMA=${SUMA}"
echo "MINIM=${MINIM}"
echo "MAXIM=${MAXIM}"
echo "MITJANA=${MITJANA}"

MENSAJE=${1}
TOKEN="5850403469:AAF3Og9mMbUwinATksG1tCE8HGNXEqNGAgM"
ID="1899653406"
URL1="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL1 -d chat_id=$ID -d text="Sa mitjana és $MITJANA"