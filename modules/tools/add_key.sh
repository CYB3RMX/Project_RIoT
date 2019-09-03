#!/bin/bash

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

echo -en "<${cyan}{ ${green}API Services${cyan} }${default}> \n"
echo -en "${red}1${green} )${default} Larger.io \n"
echo -en "${red}2${green} )${default} Shodan \n"
echo -en "${red}3${green} )${default} Zoomeye \n\n"
echo -en "$cyan[$red+$cyan]$default Choose: "
read choose

case $choose in
1) echo -en "\n${green}=>${default} Enter API key: "
   read key
   cd apikeys/;echo $key > largerio.txt ;;
2) echo -en "\n${green}=>${default} Enter API key: "
   read key
   cd apikeys/;echo $key > shodan.txt ;;
3) echo -en "\n${green}=>${default} Enter username: "
   read username
   cd apikeys/;echo $username > zoomuser.txt
   echo -en "${green}=>${default} Enter password: "
   read password
   echo $password > zoompass.txt
esac
