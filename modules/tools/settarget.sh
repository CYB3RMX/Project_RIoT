#!/bin/bash

# This script for select and change the target.

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

if [ -e temp.txt ];then
  targett=`cat temp.txt`
  echo -en "$cyan[$red+$cyan]$default Current target: $green$targett \n\n"
else
  echo -en "$cyan[${red}x$cyan]$default Not any target specified yet.\n\n"
fi

echo -en "$cyan[$red+$cyan]$default Enter a target: "
read targg
echo $targg > temp.txt
targett=`cat temp.txt`
echo -en "$red=>$default Target: $green$targett \n\n"
