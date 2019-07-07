#!/bin/bash

# Air condition system checking script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

target_ip=`cat temp.txt`
echo -en "$yellow=>$default Starting AIR system detection script against $cyan$targetip \n"
echo -en "$yellow=>$default Checking http ports...\n"
nc -z -w 1 $target_ip 80 &>/dev/null
if [ $? -eq 0 ];then
  echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}80 \n"
  echo 80 >> httpport.txt
fi
for ((http=81;http<90;http++))
do
   nc -z -w 1 $target_ip $http &>/dev/null
   if [ $? -eq 0 ];then
     echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}$http \n"
     echo $http >> httpport.txt
   fi
done
echo -en "$red=>$default If you want to check proxy ports(it takes a while.)[Y/N]?: "
read sel
case $sel in
Y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httparr=(`cat httpport.txt`)
   airwords=(`cd ..; cd keywords; cat airsystems.txt`)
   for htt in ${httparr[*]}
   do
     for aw in ${airwords[*]}
     do
        echo $air | grep "$aw" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}AIR_sys$green|$cyan>$default Found word: $green$aw$default check -> http://$target_ip:$target_port\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httparr=(`cat httpport.txt`)
   airwords=(`cd ..; cd keywords; cat airsystems.txt`)
   for htt in ${httparr[*]}
   do
     for aw in ${airwords[*]}
     do
        echo $air | grep "$aw" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}AIR_sys$green|$cyan>$default Found word: $green$aw$default check -> http://$target_ip:$target_port\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
N) echo -en "$red=>$default Proxy scanning deactivated...\n"
   httparr=(`cat httpport.txt`)
   airwords=(`cd ..; cd keywords; cat airsystems.txt`)
   for htt in ${httparr[*]}
   do
     for aw in ${airwords[*]}
     do
        echo $air | grep "$aw" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}AIR_sys$green|$cyan>$default Found word: $green$aw$default check -> http://$target_ip:$target_port\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
n) echo -en "$red=>$default Proxy scanning deactivated...\n"
   httparr=(`cat httpport.txt`)
   airwords=(`cd ..; cd keywords; cat airsystems.txt`)
   for htt in ${httparr[*]}
   do
     for aw in ${airwords[*]}
     do
        echo $air | grep "$aw" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}AIR_sys$green|$cyan>$default Found word: $green$aw$default check -> http://$target_ip:$target_port\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
*) echo -en "$red=>$default Wrong answer :( \n" ;;
esac
