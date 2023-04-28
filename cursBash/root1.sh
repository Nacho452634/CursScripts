#!/bin/bash
function usage(){
    echo "Usage ${0}"
    echo
    echo "has de ser root"
    echo "l'usuari no es pot repetir"
    exit 1
}

#Scripts per crear un usuari

#Primer comprovam si som l'usuari root
if [[ ${UID} -ne 0 ]]
then
    usage
fi

read -p "Introdueix el nom d'usuari: " USER_NAME

echo "creant l'usuari ${USER_NAME}"