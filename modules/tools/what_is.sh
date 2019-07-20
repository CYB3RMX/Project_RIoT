#!/bin/bash

c1="\e[0m"
c2="\e[91m"
c3="\e[96m"

target=`cat temp.txt`
word_array=("cloud" "Database" "VPN" "Honeypot")

echo -en $c3"["$c2"+"$c3"]"$c1" RIoT is checking the device, please wait...\n"
turnitup=`curl -sSL https://www.shodan.io/host/$target`

for wa in ${word_array[*]}
do
  echo "$turnitup" | grep -o "$wa" &>/dev/null
  if [ $? -eq 0 ];then
    if [ $wa == "cloud" ];then
      echo -en $c3"["$c2"+"$c3"]"$c1" This device is probably a cloud server.\n"
    elif [ $wa == "Database" ];then
      echo -en $c3"["$c2"+"$c3"]"$c1" This device is probably a database.\n"
    elif [ $wa == "VPN" ];then
      echo -en $c3"["$c2"+"$c3"]"$c1" This device is probably a VPN server.\n"
    elif [ $wa == "Honeypot" ];then
      echo -en $c3"["$c2"+"$c3"]"$c1" This device is probably a honeypot.\n"
    fi
  fi
done

echo "$turnitup" | grep -o "Industrial Control System" &>/dev/null
if [ $? -eq 0 ];then
  echo -en $c3"["$c2"+"$c3"]"$c1" This device is probably an ICS, so please be careful.\n"
fi
echo "$turnitup" | grep -o "Internet Scanner" &>/dev/null
if [ $? -eq 0 ];then
  echo -en $c3"["$c2"+"$c3"]"$c1" This device is probably an Internet Scanner.\n"
fi
