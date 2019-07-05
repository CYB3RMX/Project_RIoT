#!/bin/bash

cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'

query=`cat targetbanner.txt`

echo -en $cyan"+++++++++++++++++++++++++++++++++++ \n"
echo -en $red"| Available CVE's For: $query    |\n"
echo -en $cyan"+++++++++++++++++++++++++++++++++++ \n\n"$green
python3 search.py $query | grep -o "CVE-[0-9]*-[0-9]*" >> cvee.txt
for((year=1999;year<2020;year++))
do
   echo -en $cyan"["$red"+"$cyan"]"$default" Year: $green$year"$default"\n"
   echo "--------------------"
   cat cvee.txt | grep -o "CVE-$year-[0-9]*"
   echo -en "-------------------- \n\n"
done
echo -en $default"\n"
rm -rf cvee.txt
