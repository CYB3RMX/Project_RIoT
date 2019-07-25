#!/bin/bash

# OS guess script..

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

if [ -e temp.txt ];then
  machine=`cat temp.txt`
  echo -en "$yellow=>$default Executing Os Guessing script...\n\n"
  # Windows side guessing...
  echo -en "$cyan~~~~~${green}Testing if target is a windows machine$cyan~~~~~$default\n"
  nc -z -w 1 $machine 135 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}RPC (135/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 137 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}Netbios (137/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 389 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}LDAP (389/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 445 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}SMB (445/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 636 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}LDAP SSL (636/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 3268 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}Global Catalog (3268/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 3269 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}Global Catalog (3269/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 3389 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}RDP (3389/tcp)\n"
    echo "." >> win.txt
  fi
  nc -z -w 1 $machine 9389 &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found port: ${green}ADWS (9389/tcp)\n"
    echo "." >> win.txt
  fi
  echo -en "$cyan[${red}+$cyan]$default Asking to Shodan about this target machine...\n"
  look=`curl -sSL https://www.shodan.io/host/$machine`
  echo $look | grep -o "Microsoft" &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found word: ${green}Microsoft\n"
    echo "." >> win.txt
  fi
  echo $look | grep -o "Windows" &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found word: ${green}Windows\n"
    echo "." >> wint.txt
  fi
  if [ -e win.txt ];then
    echo " "
    echo -en "$cyan[${red}+$cyan]$default Target system is probably a machine with Windows OS.\n\n"
    rm -rf win.txt
  else
    echo -en "$cyan[${red}x$cyan]$default No clue found.\n"
  fi
  # Linux side guessing...
  echo -en "$cyan~~~~~${green}Testing if target is a linux machine$cyan~~~~~$default\n"
  echo -en "$cyan[${red}+$cyan]$default Asking to Shodan about this target machine...\n"
  echo $look | grep -o "Linux" &>/dev/null
  if [ $? -eq 0 ];then
    echo -en "$cyan=>$default Found word: ${green}Linux\n"
    echo "." >> lin.txt
  fi
  if [ -e lin.txt ];then
    echo -en "$cyan[${red}+$cyan]$default Target system is probably a machine with Linux OS.\n\n"
    rm -rf lin.txt
  else
    echo -en "$cyan[${red}x$cyan]$default No clue found.\n"
  fi
else
  echo -en "$cyan[${red}x$cyan]$default No target were specified.\n"
fi
