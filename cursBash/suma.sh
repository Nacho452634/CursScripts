#!/bin/bash
#control d'errades
#si no ens passen dos paràmetres donam missatge d'errada i sortim del script
NUM_PARAM=${#}
if [[ ${NUM_PARAM} -ne 2 ]]
then
    echo "ERROR: has d'introduir dos paràmetres"
    exit 1
fi

#aquest script ha de recollir dos paràmetres, els ha
#de sumar i ha d'escriure per pantalla "a+b=resultat"


A=${1}
B=${2}
SUMA=$((A+B))
echo "${A}+${B}=${SUMA}"