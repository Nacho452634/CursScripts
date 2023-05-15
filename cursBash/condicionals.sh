#!/bin/bash
read -p "Introdueix X: " X

if [[ ${X} -lt 5 ]]
then  
    echo "és menor que 5"
elif [[ ${X} -gt 5 ]]
then
    echo "és major que 5"
else
    echo "el número és 5"
fi