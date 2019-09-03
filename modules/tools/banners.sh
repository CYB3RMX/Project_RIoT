#!/bin/bash

# Banner for RIoT
g="\e[0m"
gr0="\e[96m"
gr1="\e[91m"
gr2="\e[92m"
gr3="\e[95m"

bn()
{
  sleep 2
  clear
  echo -en $gr2"______ _____    _____                          \n"
  echo -en $gr2"| ___ \_   _|  |_   _|   "$g"IoT Reconnaissance Tool \n"
  echo -en $gr2"| |_/ / | |  ___ | |     "$gr1"----------------------- \n"
  echo -en $gr2"|    /  | | / _ \| |     "$g"By CYB3RMX_ "$gr1"| \n"
  echo -en $gr2"| |\ \ _| || (_) | |                 "$gr1"| "$g"V.1.8 \n"
  echo -en $gr2"\_| \_|\___/\___/\_/                 "$gr1"|"$g"       \n\n"
}
bn
