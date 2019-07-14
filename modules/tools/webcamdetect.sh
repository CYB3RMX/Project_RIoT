#!/bin/bash

# Web Camera detection script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
default='\e[0m'

cam_ip=`cat temp.txt`
httarr=(`cat httpport.txt`)
camwords=(`cd ..; cd keywords; cat camerawords.txt`)

echo -en "$yellow=>$default Starting camera detection script against $cyan$cam_ip \n"
echo -en "$yellow=>$default Checking http ports...\n"
nc -z -w 1 $cam_ip 80 &>/dev/null
if [ $? -eq 0 ];then
  echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}80 \n"
  echo 80 >> httpport.txt
fi
for ((http=81;http<91;http++))
do
   nc -z -w 1 $cam_ip $http &>/dev/null
   if [ $? -eq 0 ];then
     echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}$http \n"
     echo $http >> httpport.txt
   fi
done
echo -en "$red=>$default If you want to check proxy ports(it takes a while.)[Y/N]?: "
read choices
case $choices in
Y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httarr=(`cat httpport.txt`)
   camwords=(`cd ..; cd keywords; cat camerawords.txt`)
   for lo in ${httarr[*]}
   do
      camlook=`curl -sSL http://$cam_ip:$lo`
      for camm in ${camwords[*]}
      do
         echo $camlook | grep "${camm}" &>/dev/null
         if [ $? -eq 0 ];then
           echo -en "$cyan>$green|${red}camera$green|$cyan>$default Found word: $green$camm$default In: ${green}http://$cam_ip:$lo $default\n"
         fi
         echo $camlook | grep "401 Unauthorized" &>/dev/null
         if [ $? -eq 0 ];then
           echo "401" &>/dev/null
           if [ $? -eq 0 ];then
             echo -en "$cyan>$green|${red}camera$green|$cyan>$default Returned 401 check -> http://$cam_ip:$lo \n"
           fi
         fi
      done
   done
   rm -rf httpport.txt ;;
y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httarr=(`cat httpport.txt`)
   camwords=(`cd ..; cd keywords; cat camerawords.txt`)
   for lo in ${httarr[*]}
   do
      camlook=`curl -sSL http://$cam_ip:$lo`
      for camm in ${camwords[*]}
      do
         echo $camlook | grep "${camm}" &>/dev/null
         if [ $? -eq 0 ];then
           echo -en "$cyan>$green|${red}camera$green|$cyan>$default Found word: $green$camm$default In: ${green}http://$cam_ip:$lo $default\n"
         fi
         echo $camlook | grep "401 Unauthorized" &>/dev/null
         if [ $? -eq 0 ];then
           echo "401" &>/dev/null
           if [ $? -eq 0 ];then
             echo -en "$cyan>$green|${red}camera$green|$cyan>$default Returned 401 check -> http://$cam_ip:$lo \n"
           fi
         fi
      done
   done
   rm -rf httpport.txt ;;
N) echo -en "$red=>$default Proxy scanning deactivated...\n"
   httarr=(`cat httpport.txt`)
   camwords=(`cd ..; cd keywords; cat camerawords.txt`)
   for lo in ${httarr[*]}
   do
      camlook=`curl -sSL http://$cam_ip:$lo`
      for camm in ${camwords[*]}
      do
         echo $camlook | grep "${camm}" &>/dev/null
         if [ $? -eq 0 ];then
           echo -en "$cyan>$green|${red}camera$green|$cyan>$default Found word: $green$camm$default In: ${green}http://$cam_ip:$lo $default\n"
         fi
         echo $camlook | grep "401 Unauthorized" &>/dev/null
         if [ $? -eq 0 ];then
           echo "401" &>/dev/null
           if [ $? -eq 0 ];then
             echo -en "$cyan>$green|${red}camera$green|$cyan>$default Returned 401 check -> http://$cam_ip:$lo $default\n"
           fi
         fi
      done
   done
   rm -rf httpport.txt ;;
n) echo -en "$red=>$default Proxy scanning deactivated...\n"
   httarr=(`cat httpport.txt`)
   camwords=(`cd ..; cd keywords; cat camerawords.txt`)
   for lo in ${httarr[*]}
   do
      camlook=`curl -sSL http://$cam_ip:$lo`
      for camm in ${camwords[*]}
      do
         echo $camlook | grep "${camm}" &>/dev/null
         if [ $? -eq 0 ];then
           echo -en "$cyan>$green|${red}camera$green|$cyan>$default Found word: $green$camm$default In: ${green}http://$cam_ip:$lo $default\n"
         fi
         echo $camlook | grep "401 Unauthorized" &>/dev/null
         if [ $? -eq 0 ];then
           echo "401" &>/dev/null
           if [ $? -eq 0 ];then
             echo -en "$cyan>$green|${red}camera$green|$cyan>$default Returned 401 check -> http://$cam_ip:$lo \n"
           fi
         fi
      done
   done
   rm -rf httpport.txt ;;
*) echo -en "$red=>$default Wrong answer :( \n" ;;
esac
