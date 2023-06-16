#!/bin/bash
function usage(){
    echo "INSTRUCCIONS ./Crear_users.sh USER_NAME [USER_NAME ... ]"
    exit 1
}
echo "${0}"
echo "directori: $(dirname ${0}) fitxer: $(basename ${0})"
NUMERO_PARAMETRES=${#}
echo "Numero de paràmetres: ${NUMERO_PARAMETRES}"
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
    usage
fi
for USER_NAME in ${@}
do
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"
    read -p "Introdueix el nom complet: " COMMENTS
    read -p "Introdueix el nom d'usuari: " USER_NAME
    read -p "Introdueix el password: " PASSWORD
    useradd -m -c "${COMMENTS}" ${USER_NAME}
    if [[ ${?} -ne 0 ]]
    then
        echo "Errada, creant l'usuari"
        exit 1
    fi
    echo "${USER_NAME}:${PASSWORD}" | chpasswd
    if [[ ${?} -ne 0 ]]  
    then
        echo "Errada, canviant password"
        exit 1
    fi
    passwd -e ${USER_NAME}
done