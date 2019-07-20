#!/bin/bash

# Router checking script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

target_ip=`cat temp.txt`
echo -en "$yellow=>$default Executing Router Detection Script against $cyan$target_ip \n"
echo -en "$yellow=>$default Checking HTTP ports...\n"
nc -z -w 1 $target_ip 80 &>/dev/null
if [ $? -eq 0 ];then
  echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}80 \n"
  echo 80 >> httpport.txt
fi
for ((http=81;http<91;http++))
do
   nc -z -w 1 $target_ip $http &>/dev/null
   if [ $? -eq 0 ];then
     echo -en "$cyan[$red+$cyan]$default Found port: ${cyan}$http \n"
     echo $http >> httpport.txt
   fi
done
echo -en "$red=>$default Do you want to check proxy ports (it will take a while.)[Y/N]?: "
read choose
case $choose in
y) echo -en "$yellow=>$default Executing Proxy Detection Script...\n"
   ./proxyportcheck.sh
   httparr=(`cat httpport.txt`)
   routerwords=(`cd ..; cd keywords; cat routerwords.txt`)
   for htt in ${httparr[*]}
   do
     rout=`curl -sSL http://$target_ip:$htt`
     for rw in ${routerwords[*]}
     do
        echo $rout | grep -o "$rw" &>/dev/null
        if [ $? -eq 0 ];then
          echo "." &>/dev/null
          if [ $? -eq 0 ];then
            echo -en "$cyan>$green|${red}router$green|$cyan>$default Found word: $green$rw$default check -> http://$target_ip:$htt\n"
          fi
        fi
     done
   done

   rm -rf httpport.txt ;;
Y) echo -en "$yellow=>$default Executing Proxy Detection Script...\n"
   ./proxyportcheck.sh
   httparr=(`cat httpport.txt`)
   routerwords=(`cd ..; cd keywords; cat routerwords.txt`)
   for htt in ${httparr[*]}
   do
     rout=`curl -sSL http://$target_ip:$htt`
     for rw in ${routerwords[*]}
     do
        echo $rout | grep -o "$rw" &>/dev/null
        if [ $? -eq 0 ];then
          echo "." &>/dev/null
          if [ $? -eq 0 ];then
            echo -en "$cyan>$green|${red}router$green|$cyan>$default Found word: $green$rw$default check -> http://$target_ip:$htt\n"
          fi
        fi
     done
   done

   rm -rf httpport.txt ;;
n) echo -en "$red=>$default Proxy scanning terminated...\n"
   httparr=(`cat httpport.txt`)
   routerwords=(`cd ..; cd keywords; cat routerwords.txt`)
   for htt in ${httparr[*]}
   do
     rout=`curl -sSL http://$target_ip:$htt`
     for rw in ${routerwords[*]}
     do
        echo $rout | grep -o "$rw" &>/dev/null
        if [ $? -eq 0 ];then
          echo "." &>/dev/null
          if [ $? -eq 0 ];then
            echo -en "$cyan>$green|${red}router$green|$cyan>$default Found word: $green$rw$default check -> http://$target_ip:$htt\n"
          fi
        fi
     done
   done

   rm -rf httpport.txt ;;
N) echo -en "$red=>$default Proxy scanning terminated...\n"
   httparr=(`cat httpport.txt`)
   routerwords=(`cd ..; cd keywords; cat routerwords.txt`)
   for htt in ${httparr[*]}
   do
     rout=`curl -sSL http://$target_ip:$htt`
     for rw in ${routerwords[*]}
     do
        echo $rout | grep -o "$rw" &>/dev/null
        if [ $? -eq 0 ];then
          echo "." &>/dev/null
          if [ $? -eq 0 ];then
            echo -en "$cyan>$green|${red}router$green|$cyan>$default Found word: $green$rw$default check -> http://$target_ip:$htt\n"
          fi
        fi
     done
   done

   rm -rf httpport.txt ;;
*) echo -en "$red=>$default Wrong answer :( \n" ;;
esac
