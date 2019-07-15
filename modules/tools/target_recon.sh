#!/bin/bash

# Target scanning script for RIoT

cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'

targetip=`cat temp.txt`
  portzz=(`cd ..; cd keywords; cat portnumbers.txt`)
  echo -en $cyan"=========="$green"PORT INFORMATION"$cyan"=========="$default
  for port in ${portzz[*]}
  do
     nc -z -w 1 $targetip $port &>/dev/null
     if [ $? -eq 0 ];then
       if [ $port -eq 21 ];then
         echo -en "\n$cyan[$red+$cyan]$default FTP (21/tcp) [${green}open$default]\n"
       elif [ $port -eq 22 ];then
         echo -en "\n$cyan[$red+$cyan]$default SSH (22/tcp) [${green}open$default]\n"
       elif [ $port -eq 23 ];then
         echo -en "\n$cyan[$red+$cyan]$default TELNET (23/tcp) [${green}open$default]\n"
       elif [ $port -eq 25 ];then
         echo -en "\n$cyan[$red+$cyan]$default SMTP (25/tcp) [${green}open$default]\n"
       elif [ $port -eq 53 ];then
         echo -en "\n$cyan[$red+$cyan]$default Domain (53/tcp) [${green}open$default]\n"
       elif [ $port -eq 80 ];then
         echo $port >> httpport.txt
         echo -en "\n$cyan[$red+$cyan]$default HTTP (80/tcp) [${green}open$default]\n"
       elif [ $port -eq 81 ];then
         for ((http=81;http<91;http++))
         do
            echo $http >> httpport.txt
            echo -en "\n$cyan[$red+$cyan]$default HTTP ($http/tcp) [${green}open$default]\n"
         done
       elif [ $port -eq 102 ];then
         echo -en "\n$cyan[$red+$cyan]$default iec-61850 (102/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}102$green|$cyan>$default Target system maybe a SIEMENS device.\n\n"
       elif [ $port -eq 137 ];then
         echo -en "\n$cyan[$red+$cyan]$default Netbios (137/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}137$green|$cyan>$default Target system maybe have windows machine.\n\n"
       elif [ $port -eq 443 ];then
         echo -en "\n$cyan[$red+$cyan]$default HTTPS (443/tcp) [${green}open$default]\n"
       elif [ $port -eq 445 ];then
         echo -en "\n$cyan[$red+$cyan]$default SMB (445/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}445$green|$cyan>$default This target have samba file server.\n"
         echo -en "$cyan=$green|${red}445$green|$cyan>$default This target probably a printer or connected with printer.\n\n"
       elif [ $port -eq 502 ];then
         echo -en "\n$cyan[$red+$cyan]$default Modbus (502/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}502$green|$cyan>$default This target is probably an ICS be careful.\n"
       elif [ $port -eq 515 ];then
         echo -en "\n$cyan[$red+$cyan]$default Line printer daemon (515/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}515$green|$cyan>$default This target probably a printer or connected with printer\n\n"
       elif [ $port -eq 554 ];then
         echo -en "\n$cyan[$red+$cyan]$default RTSP (554/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}554$green|$cyan>$default This target probably some kind of camera or connected a camera.\n\n"
       elif [ $port -eq 789 ];then
         echo -en "\n$cyan[$red+$cyan]$default Redlion-crimson3 (789/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}789$green|$cyan>$default This target is probably an ICS be careful.\n"
       elif [ $port -eq 1911 ];then
         echo -en "\n$cyan[$red+$cyan]$default Fox (1911/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}1911$green|$cyan>$default This target probably an ICS be careful.\n\n"
       elif [ $port -eq 1962 ];then
         echo -en "\n$cyan[$red+$cyan]$default Pcworx (1962/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}1962$green|$cyan>$default This target is probably an ICS be careful.\n"
       elif [ $port -eq 2002 ];then
         echo -en "\n$cyan[$red+$cyan]$default TELNET proxy (2002/tcp) [${green}open$default]\n"
       elif [ $port -eq 2121 ];then
         echo -en "\n$cyan[$red+$cyan]$default FTP proxy (2121/tcp) [${green}open$default]\n"
       elif [ $port -eq 2332 ];then
         echo -en "\n$cyan[$red+$cyan]$default TELNET proxy (2332/tcp) [${green}open$default]\n"
       elif [ $port -eq 2404 ];then
         echo -en "\n$cyan[$red+$cyan]$default iec-104 (2404/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}2404$green|$cyan>$default This target is probably an ICS be careful.\n"
       elif [ $port -eq 2455 ];then
         echo -en "\n$cyan[$red+$cyan]$default Codesys (2455/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}2455$green|$cyan>$default This target is probably an ICS be careful.\n"
       elif [ $port -eq 3128 ];then
         echo $port >> httpport.txt
         echo -en "\n$cyan[$red+$cyan]$default HTTP proxy (3128/tcp) [${green}open$default]\n"
       elif [ $port -eq 3389 ];then
         echo -en "\n$cyan[$red+$cyan]$default RDP (3389/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}3389$green|$cyan>$default This target probably a windows machine.\n\n"
       elif [ $port -eq 4911 ];then
         echo -en "\n$cyan[$red+$cyan]$default Fox (4911/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}4911$green|$cyan>$default This target probably an ICS be careful.\n\n"
       elif [ $port -eq 5007 ];then
         echo -en "\n$cyan[$red+$cyan]$default Melsec-q (5007/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}5007$green|$cyan>$default Target system maybe a MITSHUBISHI device.\n\n"
       elif [ $port -eq 5900 ];then
         for ((vnc=5900;vnc<5911;vnc++))
         do
            echo -en "\n$cyan[$red+$cyan]$default VNC ($vnc/tcp) [${green}open$default]\n"
         done
       elif [ $port -eq 9100 ];then
         echo -en "\n$cyan[$red+$cyan]$default HP JetDirect (9100/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}9100$green|$cyan>$default This target probably a printer or connected with printer.\n\n"
       elif [ $port -eq 9600 ];then
         echo -en "\n$cyan[$red+$cyan]$default Omron (9600/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}9600$green|$cyan>$default This target is probably an ICS be careful.\n"
       elif [ $port -eq 18245 ];then
         echo -en "\n$cyan[$red+$cyan]$default General Electric SRTP (18245/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}18245$green|$cyan>$default This target probably an ICS be careful.\n\n"
       elif [ $port -eq 20000 ];then
         echo -en "\n$cyan[$red+$cyan]$default dnp3 (20000/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}20000$green|$cyan>$default This target probably an ICS be careful.\n\n"
       elif [ $port -eq 44818 ];then
         echo -en "\n$cyan[$red+$cyan]$default Ethernetip (44818/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}44818$green|$cyan>$default This target probably an ICS be careful.\n\n"
       elif [ $port -eq 47808 ];then
         echo -en "\n$cyan[$red+$cyan]$default Bacnet (47808/tcp) [${green}open$default]\n"
         echo -en "$cyan=$green|${red}47808$green|$cyan>$default This target probably an ICS be careful..\n\n"
       fi
     fi
  done
