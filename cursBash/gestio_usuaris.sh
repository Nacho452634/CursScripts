#!/bin/bash
#EN FUNCIÓ DEL PRIMER PARÀMETRE CREAREM O ELIMINAREM
#ELS USUARIS QUE ENS VEGUIN D'UN FITXER QUE VINDRÀ EN EL SEGON PARÀMETREç
NOM_SCRIPT=${0}
function usage(){
    #Indicam les instruccions del script
    echo "${N0M_SCRIPT} ACTION FILE_NAME"
    echo "EXECUTAR COM A ROOT"
    exit 1
}  

function create_user(){
    echo "create user ___ ${1}"
    USER_NAME=${1}
    #Entrerem dins aquest bloc, tantes vegades com paràmetres posem al script
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"

    #CREAR L'USUARI amb el HOME
    useradd -m ${USER_NAME}
    #Comprovam si ha hagut una errada
    if [[ ${?} -ne 0 ]]
    then
        #SI ENTRAM AQUI ES PQ HI HA UNA ERRADA
        echo "Errada, creant l'usuari"
        exit 1
    fi
    
    #CANVIAM PASSWORD,
    echo "${USER_NAME}:${PASSWORD}" | chpasswd

    if [[ ${?} -ne 0 ]]  
    then
        #SI ENTRAM AQUI ES PQ HI HA UNA ERRADA
        echo "Errada, canviant password"
        exit 1
    fi

    #FER QUE L'USARI HAGI DE CANVIAR EL PASSWORD AL PRIMER LOGIN
    passwd -e ${USER_NAME}
}
function delete_user(){
    echo "delete user ___ ${1}"
    USER_NAME=${1}
     #Entrerem dins aquest bloc, tantes vegades com paràmetres posem al script
    #ELIMINAR  L'USUARI amb el HOME
    deluser --remove-home ${USER_NAME}
    #COMPROVAM SI HA HAGUT ALGUNA ERRADA
    if [[ ${?} -ne 0 ]]
    then
         #si entram aquí és pq hi ha una errada
        echo "ERRADA, BORRANT USUARI"
        exit 1
    fi
}

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
