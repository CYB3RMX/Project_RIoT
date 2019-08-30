#!/bin/bash

# A simple mac vendor lookup script...

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

echo -en "$cyan[$red+$cyan]$default Enter target's MAC address: "
read vendor

maclook=`curl -sSL https://api.macvendors.com/$vendor`

echo -en "\n$cyan=>$default $maclook \n\n"
