#!/bin/bash
#EN FUNCIÓ DEL PRIMER PARÀMETRE CREAREM O ELIMINAREM
#ELS USUARIS QUE ENS VEGUIN D'UN FITXER QUE VINDRÀ EN EL SEGON PARÀMETREç
NOM_SCRIPT=${0}
function usage(){
    #Indicam les instruccions del script
    echo "${N0M_SCRIPT}"
    echo "EXECUTAR COM A ROOT"
    exit 1
}  

function 
#COMPROVAR QUE SOU ROOT
if [ ${UID} -ne 0 ]
then
    usage
fi


NUMERO_PARAMETRES=${#}

# Si el número de paràmetres és igual zero ha de sortir (exit 1),
#indicant que el primer paràmetre és obligatori i que rebrà de nom USER_NAME, 
#i que pot rebre paràmetres opcionals que també seran noms d'usuaris.

if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
     #errada, necessitam al manco un paràmetre
    usage
fi
