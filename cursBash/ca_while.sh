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
    deluser --remove-home ${USER_NAME}
    shift
done 