#!/bin/bash

# Target scanning script for RIoT

cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'

targetip=`cat temp.txt`

  echo $targetip > deviceType.txt
  portzz=(`cd ..; cd keywords; cat portnumbers.txt`)
  echo -en $cyan"=========="$green"PORT INFORMATION"$cyan"=========="$default
  for port in ${portzz[*]}
  do
     nc -z -w 1 $targetip $port &>/dev/null
     if [ $? -eq 0 ];then
       if [ $port -eq 21 ];then
         echo -en "\n$cyan[$red+$cyan]$default FTP port open...\n"
       elif [ $port -eq 22 ];then
         echo -en "\n$cyan[$red+$cyan]$default SSH port open...\n"
       elif [ $port -eq 23 ];then
         echo -en "\n$cyan[$red+$cyan]$default TELNET port open...\n"
       elif [ $port -eq 25 ];then
         echo -en "\n$cyan[$red+$cyan]$default SMTP port open...\n"
       elif [ $port -eq 53 ];then
         echo -en "\n$cyan[$red+$cyan]$default Domain port open...\n"
       elif [ $port -eq 80 ];then
         echo $port > httpport.txt
         echo -en "\n$cyan[$red+$cyan]$default HTTP port open...\n"
       elif [ $port -eq 81 ];then
         for ((http=80;http<90;http++))
         do
            echo $http > httpport.txt
            echo -en "\n$cyan[$red+$cyan]$default HTTP port: $http open...\n"
         done
       elif [ $port -eq 137 ];then
         echo -en "\n$cyan[$red+$cyan]$default Netbios port open...\n"
         echo -en "$cyan=$green|${red}137$green|$cyan>$default Target system maybe have windows machine.\n\n"
       elif [ $port -eq 443 ];then
         echo -en "\n$cyan[$red+$cyan]$default HTTPS port open...\n"
       elif [ $port -eq 445 ];then
         echo -en "\n$cyan[$red+$cyan]$default SMB port open...\n"
         echo -en "$cyan=$green|${red}445$green|$cyan>$default This target have samba file server\n"
         echo -en "$cyan=$green|${red}445$green|$cyan>$default This target probably a printer or connected with printer\n\n"
       elif [ $port -eq 515 ];then
         echo -en "\n$cyan[$red+$cyan]$default Line printer daemon port open...\n"
         echo -en "$cyan=$green|${red}515$green|$cyan>$default This target probably a printer or connected with printer\n\n"
       elif [ $port -eq 554 ];then
         echo -en "\n$cyan[$red+$cyan]$default RTSP port open...\n"
         echo -en "$cyan=$green|${red}554$green|$cyan>$default This target probably some kind of camera or connected a camera.\n\n"
       elif [ $port -eq 2002 ];then
         echo -en "\n$cyan[$red+$cyan]$default TELNET proxy port open...\n"
       elif [ $port -eq 2121 ];then
         echo -en "\n$cyan[$red+$cyan]$default FTP proxy port open...\n"
       elif [ $port -eq 9100 ];then
         echo -en "\n$cyan[$red+$cyan]$default HP JetDirect port open...\n"
         echo -en "$cyan=$green|${red}9100$green|$cyan>$default This target probably a printer or connected with printer\n\n"
       fi
     fi
  done

rm -rf httpport.txt
rm -rf deviceType.txt
