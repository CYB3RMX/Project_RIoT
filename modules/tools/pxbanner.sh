#!/bin/bash

# Banner grabbing script
cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'

target=`cat temp.txt`

portz=(21 22 23 25 80 137 443 445 2002 2121)
echo -en $cyan"=========="$green"BANNER INFORMATION"$cyan"=========="$default"\n"
for px in ${portz[*]}
do
   nc -z -w 1 $target $px &>/dev/null
   if [ $? -eq 0 ];then
     if [ $px -eq 21 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 21: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 22 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 22: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 23 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 23: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 25 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 23: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 80 ];then
       exec 3<>/dev/tcp/$target/$px
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-25 targethttp.txt > targetbanner.txt
       alyx=`cut -c9-25 targethttp.txt`
       echo " "
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port 80: $alyx \n\n"
       ./cvelister.sh
       rm -rf targethttp.txt
     elif [ $px -eq 137 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 137: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 443 ];then
       exec 3<>/dev/tcp/$target/$px
       echo -e "GET / HTTP/1.1\r\nhost: $target\r\nConnection: close\r\n\r\n" >&3
       cat <&3 | grep -o "Server: [a-zA-Z0-9]*/[0-9]*.[0-9]*.*" > targethttp.txt
       cut -c9-25 targethttp.txt > targetbanner.txt
       alyx0=`cut -c9-25 targethttp.txt`
       echo " "
       echo -en $cyan"["$red"+"$cyan"]"$default"Server info for port 443: $alyx0 \n\n"
       ./cvelister.sh
       rm -rf targethttp.txt
     elif [ $px -eq 445 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 445: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 2002 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 2002: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 2121 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default"Banner info for port 2121: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     fi
   fi
done
