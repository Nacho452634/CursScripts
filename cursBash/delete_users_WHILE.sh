#!/bin/bash

#!/bin/bash
function usage(){
    #Indicam les instruccions del script
    echo "INSTRUCCIONS: ./Crear_users_WHILE.sh USER_NAME [USER_NAME ... ]"
    echo "EXECUTAR COM A ROOT"
    exit 1
}

#COMPROVAR QUE SOM ROOT
if [ ${UID} -ne 0 ]
then
    usage
fi

#COMPROVAR QUE HI HA PARAMETRES
if [[ ${#} -eq 0 ]]
then
    usage
fi

echo
#recorrer paràmetres amb While
echo "Iteració amb WHILE"
while [[ ${#} -ge 1 ]]
do
    #${1} indica el paràmetre en primera posició
    USER_NAME=${1}
    deluser --remove-home ${USER_NAME}
    shift
done