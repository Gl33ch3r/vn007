#!/bin/bash
printf "Content-Type: text/html\r\n\r\n"
#/usr/bin/env
read line
imei=`echo "$line" | awk '{split($0,array,"&")} END{print array[1]}' | awk '{split($0,array,"=")} END{print array[2]}'`
comm=$(atcmd 'AT+SPIMEI=0,"'$imei'" -D')
echo $comm
reboot
