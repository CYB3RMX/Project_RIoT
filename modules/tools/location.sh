#!/bin/bash

# This script for get_location command.

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

if [ -e temp.txt ];then
  target=`cat temp.txt`
  echo -en "$cyan==========${green}LOCATION INFORMATION$cyan==========$default \n"
  curl -sSL http://ip-api.com/$target
else
  echo -en "$cyan[${red}x$cyan]$default Not any target specified yet.\n"
fi
