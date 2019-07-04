#!/bin/bash

# CVE listing script

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'

if [ -e targetbanner.txt ];then
  bann=(`cat targetbanner.txt`)
  echo -en $cyan" ___________________________________ \n"
  echo -en $red"|                                   | \n"
  echo -en $red"|"$green"     AVAILABLE CVE's For: "$default$bann""$red"  | \n"
  echo -en $red"|"$cyan"___________________________________"$red"| \n\n$default"
  array=(`cd ..; cd CVE-Database; ls`)
  for fol in ${array[*]}
  do
     myarr=(`cd ..; cd CVE-Database/$fol; ls`)
     for file in ${myarr[*]}
     do
        cat ../CVE-Database/$fol/$file | grep -o $bann &>/dev/null
        if [ $? -eq 0 ];then
          echo $file >> cvetemp.txt
        fi
     done
  done
  if [ -e cvetemp.txt ];then
    cat cvetemp.txt | grep -o "CVE-[0-9]*-[0-9]*" > years.txt
    for ((year=1999;year<2020;year++))
    do
       echo -en $cyan"|$red+$cyan|$default Year: $green$year \n"
       echo "-------------------------"
       cat years.txt | grep -o "CVE-$year-[0-9]*"
       echo "-------------------------"
    done
    rm -rf years.txt
    rm -rf cvetemp.txt
  else
    echo -en $cyan"|${red}x$cyan|$default No available CVE found...\n"
  fi
  rm -rf targetbanner.txt
else
  echo -en $cyan"|${red}x$cyan|$default Unknown banner information...\n"
fi
