#!/bin/bash
function usage(){
    #Indicam les instruccions del script
    echo "INSTRUCCIONS ./Tasca_paràmetres.sh USER_NAME [USER_NAME ... ]"
    exit 1
}


# El nom del script que s'executa
echo "${0}"
# El PATH i el filename del script
echo "directori: $(dirname ${0}) fitxer: $(basename ${0})"
# El número de paràmetres
NUMERO_PARAMETRES=${#}
echo "Numero de paràmetres: ${NUMERO_PARAMETRES}"
# Si el número de paràmetres és igual zero ha de sortir indicant que el primer paràmetre és obligatori i que rebrà de nom USER_NAME, i que pot rebre paràmetres opcionals que també seran noms d'usuaris.
if [[ ${NUMERO_PARAMETRES} -eq 0 ]]
then
    usage
fi
# # Afegir tots els paràmetres dins una variable i mostrar-la per pantalla.
# TOTS_ELS_PARAMETRES=${*}
# echo "TOTS ELS PARÀMETRES: ${TOTS_ELS_PARAMETRES}"
# #Desplaçar els paràmetres a l'esquerra
# shift
# #Tornar a mostrar tots els paràmetres
# TOTS_ELS_PARAMETRES=${*}
# echo "TOTS ELS PARÀMETRES: ${TOTS_ELS_PARAMETRES}"
# # Generau un password per cada un dels usuaris passats com a paràmetres.
for USER_NAME in ${@}
do
    #Entrerem dins aquest bloc, tantes vegades com paràmetres posem al script
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${USER_NAME}:${PASSWORD}"
done
