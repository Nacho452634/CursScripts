#!/bin/bash

#Genera un nombre aleatori entre 1 i 10:
adivina=$(( ( RANDOM % 10 )  + 1 ))
vides=3

 while [[ ${vides} -ne 0 ]]
do
    read -p "Introdueix un número: " Introduit
    if [[ ${Introduit} -eq ${adivina} ]]
    then
        echo "Eureka!"
        exit 0
    fi

    if [[ ${Introduit} -lt ${adivina} ]]
    then
        echo "Fred!"
    else
        echo "Calent!"
    fi
    vides=$(( vides-1 ))
    echo "vides : ${vides}"    
done
echo "El número era ${adivina}"