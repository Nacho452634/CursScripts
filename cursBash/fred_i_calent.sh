#!/bin/bash

#Genera un nombre aleatori entre 1 i 10:
adivina=$(( ( RANDOM % 10 )  + 1 ))
echo "adivina: ${adivina}"

########################################################
# Escriu el teu codi aqui
read -p "indica el teu numero: " A

if [[ ${A} -eq ${adivina} ]]
then
    echo "Eureka!"
    exit 0
fi

if [[ ${A} < ${adivina} ]]
then
    echo "Fred!"
    exit 1
fi

if [[ ${A} > ${adivina} ]]
then
    echo "Calent!"
    exit 1
fi

echo "El nombre que havies d'adivinar era: ${adivina}"
