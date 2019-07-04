#!/bin/bash

# Web Camera detection script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
default='\e[0m'

cam_ip=`cat deviceType.txt`
httpport=`cat httpport.txt`

echo -en "$yellow=>$default Starting camera detection script against $cyan$cam_ip \n"
camlook=`curl -sSL http://$cam_ip:$httpport`
camwords=(`cd ..; cd keywords; cat camerawords.txt`)
for camm in ${camwords[*]}
do
   echo $camlook | grep "${camm}" &>/dev/null
   if [ $? -eq 0 ];then
     echo -en "$cyan>$green|${red}camera$green|$cyan>$default Found word: $green$camm$default.\n"
   fi
   echo $camlook | grep "401 Unauthorized" &>/dev/null
   if [ $? -eq 0 ];then
     echo -en "$cyan>$green|${red}camera$green|$cyan>$default Returned 401 check -> http://$cam_ip \n" &>/dev/null
     if [ $? -eq 0 ];then
       echo -en "$cyan>$green|${red}camera$green|$cyan>$default Returned 401 check -> http://$cam_ip \n"
     fi
   fi
done
