#!/bin/bash

# Proxy port checking script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
default='\e[0m'

if [ -e temp.txt ];then
  targetip=`cat temp.txt`
  echo -en "$yellow=>$default This process can take a little while to complete. Get your coffee and wait :). \n"
  nmap -Pn -T 4 $targetip -p 8000-9000 >> porttemp.txt
  nmap -Pn -T 4 $targetip -p 9001-10000 >> porttemp.txt
  for ((ports=8000;ports<10000;ports++))
  do
     cat porttemp.txt | grep -o "${ports}/tcp open" &>/dev/null
     if [ $? -eq 0 ];then
       echo -en "$cyan>$green|${red}proxy$green|$cyan>$default Found port: $green$ports$default \n"
       echo $ports >> httpport.txt
     fi
  done
  rm -rf porttemp.txt
else
  echo -en "$cyan[${red}x$cyan]$default No target were specified.\n"
fi
