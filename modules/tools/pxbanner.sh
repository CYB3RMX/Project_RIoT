#!/bin/bash

# Banner grabbing script
cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'

target=`cat temp.txt`
portz=(21 22 23 25 80 137 443 445 2002 2121 3128)
echo -en $cyan"=========="$green"BANNER INFORMATION"$cyan"=========="$default"\n"
for px in ${portz[*]}
do
   nc -z -w 1 $target $px &>/dev/null
   if [ $? -eq 0 ];then
     if [ $px -eq 21 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 21(ftp/tcp): "
       python3 bannergrabber.py $target $px
       ./cvelister.sh
     elif [ $px -eq 22 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 22(ssh/tcp): "
       python3 bannergrabber.py $target $px
       gett=`cat banners.txt`
       python2 cveparser.py $gett
     elif [ $px -eq 23 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 23(telnet/tcp): "
       python3 bannergrabber.py $target $px
       ./cvelister.sh
     elif [ $px -eq 25 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 25(smtp/tcp): "
       python3 bannergrabber.py $target $px
       ./cvelister.sh
     elif [ $px -eq 80 ];then
       exec 3<>/dev/tcp/$target/$px
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-40 targethttp.txt > banners.txt
       alyx=`cut -c9-40 targethttp.txt`
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port 80(http/tcp): $alyx \n\n"
       python2 cveparser.py $alyx
       rm -rf targethttp.txt
     elif [ $px -eq 137 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 137(netbios/tcp): "
       python3 bannergrabber.py $target $px
       ./cvelister.sh
     elif [ $px -eq 443 ];then
       exec 3<>/dev/tcp/$target/$px
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-40 targethttp.txt > banners.txt
       alyx0=`cut -c9-40 targethttp.txt`
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port 443(https/tcp): $alyx0 \n\n"
       python2 cveparser.py $alyx0
       rm -rf targethttp.txt
     elif [ $px -eq 445 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 445(smb/tcp): "
       python3 bannergrabber.py $target $px
       ./cvelister.sh
     elif [ $px -eq 2002 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 2002(telnet/ftp): "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 2121 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 2121(ftp/tcp): "
       python3 bannergrabber.py $target $px
       ./cvelister.sh
     elif [ $px -eq 3128 ];then
       exec 3<>/dev/tcp/$target/$px
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-40 targethttp.txt > banners.txt
       alyx0=`cut -c9-40 targethttp.txt`
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port 3128(http/tcp): $alyx0 \n\n"
       python2 cveparser.py $alyx0
       rm -rf targethttp.txt
     fi
   fi
done
echo -en "$red=>$default If you want to check proxy ports(it takes a while.)[Y/N]?: "
read choice
case $choice in
Y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httarr=(`cat httpport.txt`)
   for hp in ${httarr[*]}
   do
       exec 3<>/dev/tcp/$target/$hp
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-40 targethttp.txt > banners.txt
       alyx0=`cut -c9-40 targethttp.txt`
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port $hp(http/tcp): $alyx0 \n\n"
       python2 cveparser.py $alyx0
       rm -rf targethttp.txt
   done ;;
y) echo -en "$yellow=>$default Starting proxy detection script \n"
   ./proxyportcheck.sh
   httarr=(`cat httpport.txt`)
   for hp in ${httarr[*]}
   do
       exec 3<>/dev/tcp/$target/$hp
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-40 targethttp.txt > banners.txt
       alyx0=`cut -c9-40 targethttp.txt`
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port $hp(http/tcp): $alyx0 \n\n"
       python2 cveparser.py $alyx0
       rm -rf targethttp.txt
   done ;;
*) echo -en "$red=>$default Scanning ended \n" ;;
esac
