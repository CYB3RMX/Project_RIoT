#!/bin/bash

cyan='\e[96m'
red='\e[91m'
yellow='\e[93m'
default='\e[0m'
green='\e[92m'


if [ -e banners.txt ];then
  query=`cat banners.txt`
  echo -en $cyan"+++++++++++++++++++++++++++++++++++++++++++++ \n"
  echo -en $red "Available CVE information for: $query \n"
  echo -en $cyan"+++++++++++++++++++++++++++++++++++++++++++++ \n\n"$green
  python3 search.py $query | grep -o "CVE-[0-9]*-[0-9]*" >> cvee.txt

  for((year=1999;year<2020;year++))
  do
     cat cvee.txt | grep -o "CVE-$year-[0-9]*" &>/dev/null
     if [ $? -eq 0 ];then
       echo -en $cyan"["$red"+"$cyan"]"$default" Year: $green$year"$default"\n"
       echo "--------------------"
       cat cvee.txt | grep -o "CVE-$year-[0-9]*"
       echo -en "-------------------- \n\n"
     fi
  done
  echo -en $default"\n"
  rm -rf cvee.txt
  rm -rf banners.txt
else
  echo -en $cyan"["$red"!"$cyan"]"$default" Sorry, couldn't get banner information :( \n"
fi
