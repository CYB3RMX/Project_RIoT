#!/bin/bash

# Router checking script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

target_ip=`cat temp.txt`
echo -en "$yellow=>$default Starting facility system detection script against $cyan$target_ip \n"
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
read choose
case $choose in
y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httparr=(`cat httpport.txt`)
   facil=(`cd ..; cd keywords; cat facilitywords.txt`)
   for htt in ${httparr[*]}
   do
     facill=`curl -sSL http://$target_ip:$htt`
     for fc in ${facil[*]}
     do
        echo $facill | grep -o "$fc" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}facility_sys$green|$cyan>$default Found word: $green$fc$default check -> http://$target_ip:$htt\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
Y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httparr=(`cat httpport.txt`)
   facil=(`cd ..; cd keywords; cat facilitywords.txt`)
   for htt in ${httparr[*]}
   do
     facill=`curl -sSL http://$target_ip:$htt`
     for fc in ${facil[*]}
     do
        echo $facill | grep -o "$fc" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}facility_sys$green|$cyan>$default Found word: $green$fc$default check -> http://$target_ip:$htt\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
n) echo -en "$red=>$default Proxy scanning deactivated...\n"
   httparr=(`cat httpport.txt`)
   facil=(`cd ..; cd keywords; cat facilitywords.txt`)
   for htt in ${httparr[*]}
   do
     facill=`curl -sSL http://$target_ip:$htt`
     for fc in ${facil[*]}
     do
        echo $facill | grep -o "$fc" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}facility_sys$green|$cyan>$default Found word: $green$fc$default check -> http://$target_ip:$htt\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
N) echo -en "$red=>$default Proxy scanning deactivated...\n"
   httparr=(`cat httpport.txt`)
   facil=(`cd ..; cd keywords; cat facilitywords.txt`)
   for htt in ${httparr[*]}
   do
     facill=`curl -sSL http://$target_ip:$htt`
     for fc in ${facil[*]}
     do
        echo $facill | grep -o "$fc" &>/dev/null
        if [ $? -eq 0 ];then
          echo -en "$cyan>$green|${red}facility_sys$green|$cyan>$default Found word: $green$fc$default check -> http://$target_ip:$htt\n"
        fi
     done
   done

   rm -rf httpport.txt ;;
*) echo -en "$red=>$default Wrong answer :( \n" ;;
esac
