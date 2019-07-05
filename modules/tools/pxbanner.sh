#!/bin/bash

# Banner grabbing script
cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'

target=`cat temp.txt`

portz=(21 22 23 25 137 445 2002 2121)
echo -en $cyan"=========="$green"BANNER INFORMATION"$cyan"=========="$default"\n"
for px in ${portz[*]}
do
   nc -z -w 1 $target $px &>/dev/null
   if [ $? -eq 0 ];then
     if [ $px -eq 21 ];then
       echo -en "Banner info for port 21: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 22 ];then
       echo -en "Banner info for port 22: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 23 ];then
       echo -en "Banner info for port 23: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 25 ];then
       echo -en "Banner info for port 23: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 137 ];then
       echo -en "Banner info for port 137: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 445 ];then
       echo -en "Banner info for port 445: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 2002 ];then
       echo -en "Banner info for port 2002: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     elif [ $px -eq 2121 ];then
       echo -en "Banner info for port 2121: "
       python3 bannergrabber.py $target $px
       ./bannerfilter.sh
       ./cvelister.sh
     fi
   fi
done
