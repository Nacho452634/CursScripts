#!/bin/bash
function usage(){
    echo "INSTRUCCIONS: ./Crear_users_WHILE.sh USER_NAME [USER_NAME ... ]"
    exit 1
}
if [ ${UID} -ne 0 ]
then
    usage
fi
if [[ ${#} -eq 0 ]]
then
    usage
fi
echo
echo "Iteració amb WHILE"
while [[ ${#} -ge 1 ]]
do
    USER_NAME=${1}
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"
    useradd -m -c "${COMMENTS}" ${USER_NAME} 
    if [[ ${?} -ne 0 ]]
    then
        echo "Errada, creant l'usuari"
        exit 1
    fi
    echo "${USER_NAME}:${PASSWORD}" | chpasswd
    passwd -e ${USER_NAME}
    shift
done



