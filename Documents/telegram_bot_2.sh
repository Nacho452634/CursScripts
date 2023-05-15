#!/bin/bash

MENSAJE=${1}
TOKEN="5850403469:AAF3Og9mMbUwinATksG1tCE8HGNXEqNGAgM"
ID="1899653406"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"