#!/bin/bash

IP=$(curl ifconfig.me)
DATA=$(date)
HOST=$(hostname)
MENSAJE="S'ha reiniciat ${HOST} a les ${DATA} ip: ${IP}"

echo $MENSAJE
/home/nacho/CursScripts/Documents/telegram_bot_2.sh "${MENSAJE}"
