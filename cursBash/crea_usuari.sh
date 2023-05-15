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

read -p "Introdueix el nom complet: " COMMENTS
#demanam el nom de l'usuari 
read -p "Introdueix el nom d'usuari: " USER_NAME
#demanam el password
read -p "Introdueix el password: " PASSWORD


#crearíem l'usuari
useradd -m -c "${COMMENTS}" ${USER_NAME}

exit 0
