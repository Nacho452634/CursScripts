#!/bin/bash
echo "has introduit els numeros "
DIVISIO=$(echo "scale=2; ${1}/${2}" | bc)
echo "${1}/${2}=${DIVISIO}"