#!/bin/bash
function usage(){
    echo "INSTRUCCIONS: ./delete_users.sh USER_NAME [USER_NAME ... ]"
    exit 1
}  
if [ ${UID} -ne 0 ]
then 
    usage
fi
NUMERO_PARAMETRES=${#}
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
    usage
fi
for USER_NAME in ${@}
do
    deluser --remove-home ${USER_NAME}
    if [[ ${?} -ne 0 ]]
    then
        echo "ERRADA, BORRANT USUARI"
        exit 1
    fi  
done