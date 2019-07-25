#!/bin/bash

# Detecting what web technologies used..

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

if [ -e temp.txt ];then
  target=`cat temp.txt`
  if [ -e httpport.txt ];then
    echo -en "$cyan[$red+$cyan]$default Checking target with Shodan...\n"
    look=`curl -sSL https://www.shodan.io/host/$target`
    echo $look | grep -o "AngularJS" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} AngularJS $default\n"
    fi
    echo $look | grep -o "Font Awesome" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} Font Awesome $default\n"
    fi
    echo $look | grep -o "Google Font API" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} Google Font API $default\n"
    fi
    echo $look | grep -o "jQuery" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} jQuery $default\n"
    fi
    echo $look | grep -o "ZURB Foundation" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} ZURB Foundation $default\n"
    fi
    echo $look | grep -o "YouTube" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} YouTube $default\n"
    fi
    echo $look | grep -o "Google Tag Manager" &>/dev/null
    if [ $? -eq 0 ];then
      echo -en "$yellow=>$default Found:${green} Google Tag Manager $default\n"
    fi
  else
    echo -en "$cyan[${red}x$cyan]$default No HTTP ports found yet. Did you use >port_lookup< ?\n"
  fi
else
  echo -en "$cyan[${red}x$cyan]$default No target were specified.\n"
fi
