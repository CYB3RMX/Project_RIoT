#!/bin/bash

# Detecting what web technologies are used..

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

cd apikeys/;cat largerio.txt &>/dev/null
if [ $? -eq 0 ];then
  api_key=`cd ..;cd apikeys/;cat largerio.txt`
  echo -en "$cyan[$red+$cyan]$default Enter target: "
  read webtarget
  look=`curl -sSL https://api.larger.io/v1/search/key/$api_key?domain=$webtarget`
  echo -en "\n$cyan=| ${green}According to API ${cyan}|=\n\n"
  array=("CloudFlare" "Lua" "OpenResty" "Nginx" "HeadJS" "jQuery")
  for tech in ${array[*]}
  do
    echo $look | grep -o "$tech" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$cyan=>$default $tech \n"
    fi
  done
  echo $look | grep -o "Google Analytics" &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Google Analytics \n"
  fi
  echo $look | grep -o "Google Font API" &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Google Font API \n"
  fi
  # If api doesnt work...
  alternate=`curl -sSL http://$webtarget`
  echo -en "\n$cyan=| ${green}According to source code ${cyan}|=\n\n"
  echo $alternate | grep -o "fonts.googleapis.com" &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Google Font API \n"
  fi
else
  echo -en "$cyan[${red}!$cyan]$default API key not found visit ${green}https://api.larger.io/ \n"
fi
