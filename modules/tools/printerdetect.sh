#!/bin/bash

# Printer detection script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
default='\e[0m'

if [ -e temp.txt ];then
  found=`cat temp.txt`
  echo -en "$yellow=>$default Executing Printer Detection Script against $cyan$found \n"
  echo -en "$yellow=>$default Checking HTTP ports...\n"
  nc -z -w 1 $found 80 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}80 \n"
    echo "80" >> httpport.txt
  fi
  for ((http=81;http<91;http++))
  do
     nc -z -w 1 $found $http &>/dev/null
     if [ $? -eq 0 ];then
       echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}$http \n"
       echo $http >> httpport.txt
     fi
  done
  echo -en "$red=>$default Do you want to check proxy ports (it will take a while.)[Y/N]?: "
  read choice
  case $choice in
  Y) echo -en "$yellow=>$default Executing Proxy Detection Script...\n"
     ./proxyportcheck.sh
     httarr=(`cat httpport.txt`)
     for lo in ${httarr[*]}
     do
       ifacelook=`curl -sSL http://$found:$lo`
       echo $ifacelook | grep -o "Copyright(C) 2000-2012 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2010 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Printer Firmware Version" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2009 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2005 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "HP LaserJet" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
     done
     rm -rf httpport.txt ;;
  y) echo -en "$yellow=>$default Executing Proxy Detection Script...\n"
     ./proxyportcheck.sh
     httarr=(`cat httpport.txt`)
     for lo in ${httarr[*]}
     do
       ifacelook=`curl -sSL http://$found:$lo`
       echo $ifacelook | grep -o "Copyright(C) 2000-2012 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2010 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Printer Firmware Version" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2009 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2005 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "HP LaserJet" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
     done
     rm -rf httpport.txt ;;
  n) echo -en "$red=>$default Proxy scanning terminated...\n"
     httarr=(`cat httpport.txt`)
     for lo in ${httarr[*]}
     do
       ifacelook=`curl -sSL http://$found:$lo`
       echo $ifacelook | grep -o "Copyright(C) 2000-2012 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2010 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Printer Firmware Version" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2009 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2005 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "HP LaserJet" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
     done
     rm -rf httpport.txt ;;
  N) echo -en "$red=>$default Proxy scanning terminated...\n"
     httarr=(`cat httpport.txt`)
     for lo in ${httarr[*]}
     do
       ifacelook=`curl -sSL http://$found:$lo`
       echo $ifacelook | grep -o "Copyright(C) 2000-2012 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2010 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Printer Firmware Version" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2009 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "Copyright(C) 2000-2005 Brother Industries" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
       echo $ifacelook | grep -o "HP LaserJet" &>/dev/null
       if [ $? -eq 0 ];then
         echo -en "$cyan>$green|${red}printer$green|$cyan>$default This device is a printer -> Check: http://$found:$lo \n"
       fi
     done
     rm -rf httpport.txt ;;
  *) echo -en "$red=>$default Wrong answer :( \n" ;;
  esac
else
  echo -en "$cyan[${red}x$cyan]$default No target were specified.\n"
fi
