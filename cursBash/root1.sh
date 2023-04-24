#!/bin/bash

#Scripts per crear un usuari

#Primer comprovam si som l'usuari root
if [[ ${UID} -ne 0 ]]
then
    echo "Usage ${0}"
    echo
    echo "has de ser root"
    exit 1
fi

read -p "Introdueix el nom d'usuari: "