#!/bin/bash

# Proxy port checking script for devices

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
default='\e[0m'

targetip=`cat temp.txt`
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"

echo -n "[scanning] ${spin[0]}"
for ((l_start=8000;l_start<10000;l_start++))
do
  for i in "${spin[@]}"
  do
      echo -ne "\b$i"
      sleep 0.1
  done
  nc -z -w 1 $targetip $l_start &>/dev/null
  if [ $? -eq 0 ];then
    echo $l_start >> httpport.txt
    echo -en "\n$cyan>$green|${red}proxy$green|$cyan>$default Found port: $cyan${l_start} \n"
  fi
done
