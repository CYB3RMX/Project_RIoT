#!/bin/bash

# Banners for RIoT
g="\e[0m"
gr0="\e[96m"
gr1="\e[91m"
gr2="\e[92m"
gr3="\e[95m"

ran=$((( RANDOM % 4 ) + 1))

bn()
{
  echo -en $gr3"################################################### \n"
  echo -en $gr3"#                           ||                    "$gr3"# \n"
  echo -en $gr3"# "$gr0"█▄▄▄▄ ▄█ ████▄    ▄▄▄▄▀   "$gr3"|| "$g"IoT Security Audit "$gr3"# \n"
  echo -en $gr3"# "$gr0"█  ▄▀ ██ █   █ ▀▀▀ █      "$gr3"||       "$g"Tool         "$gr3"# \n"
  echo -en $gr3"# "$gr0"█▀▀▌  ██ █   █     █      "$gr3"||                    # \n"
  echo -en $gr3"# "$gr0"█  █  ▐█ ▀████    █       "$gr3"||     "$g"By CYB3RMX_    "$gr3"# \n"
  echo -en $gr3"# "$gr0"  █    ▐         ▀        "$gr3"||--------------------# \n"
  echo -en $gr3"# "$gr0" ▀                        "$gr3"||    "$g"version: 1.3    "$gr3"# \n"
  echo -en $gr3"################################################### "$g"\n"
}
bn1()
{
  echo -en $gr2"______ _____    _____                          \n"
  echo -en $gr2"| ___ \_   _|  |_   _|   "$g"IoT Security Auditing \n"
  echo -en $gr2"| |_/ / | |  ___ | |     "$gr1"--------------------- \n"
  echo -en $gr2"|    /  | | / _ \| |     "$g"By CYB3RMX_ "$gr1"| \n"
  echo -en $gr2"| |\ \ _| || (_) | |                 "$gr1"| "$g"V.1.3 \n"
  echo -en $gr2"\_| \_|\___/\___/\_/                 "$gr1"|"$g"       \n"
}
bn2()
{
  echo -en "         "$gr0"_            "$gr1"_          "$gr2"_          "$gr3"_  \n"
  echo -en "        "$gr0"/\ \         "$gr1"/\ \       "$gr2"/\ \       "$gr3"/\ \  \n"
  echo -en "       "$gr0"/  \ \        "$gr1"\ \ \     "$gr2"/  \ \      "$gr3"\_\ \  \n"
  echo -en "      "$gr0"/ /\ \ \       "$gr1"/\ \_\   "$gr2"/ /\ \ \     "$gr3"/\__ \ \n"
  echo -en "     "$gr0"/ / /\ \_\     "$gr1"/ /\/_/  "$gr2"/ / /\ \ \   "$gr3"/ /_ \ \ \n"
  echo -en "    "$gr0"/ / /_/ / /    "$gr1"/ / /    "$gr2"/ / /  \ \_\ "$gr3"/ / /\ \ \ \n"
  echo -en "   "$gr0"/ / /__\/ /    "$gr1"/ / /    "$gr2"/ / /   / / /"$gr3"/ / /  \/_/ \n"
  echo -en "  "$gr0"/ / /_____/    "$gr1"/ / /    "$gr2"/ / /   / / /"$gr3"/ / / \n"
  echo -en " "$gr0"/ / /\ \ \  "$gr1"___/ / /__  "$gr2"/ / /___/ / /"$gr3"/ / / \n"
  echo -en ""$gr0"/ / /  \ \ \""$gr1"/\__\/_/___\""$gr2"/ / /____\/ /"$gr3"/_/ / \n"
  echo -en ""$gr0"\/_/    "$gr0"\_\/"$gr1"\/_________/"$gr2"\/_________/ "$gr3"\_\/     "$g"version: 1.3 \n\n"
  echo -en "       |>> IoT Security Auditing Tool<<| \n"
  echo -en "               || By CYB3RMX_ || \n\n"
}
bn3()
{
  echo -en $gr2" ██▀███   ██▓ ▒█████  ▄▄▄█████▓ \n"
  echo -en "▓██ ▒ ██▒▓██▒▒██▒  ██▒▓  ██▒ ▓▒  "$gr0"============== \n"
  echo -en $gr2"▓██ ░▄█ ▒▒██▒▒██░  ██▒▒ ▓██░ ▒░ "$gr1"| "$g"version: 1.3 "$gr1"| \n"
  echo -en $gr2"▒██▀▀█▄  ░██░▒██   ██░░ ▓██▓ ░   "$gr0"============== \n"
  echo -en $gr2"░██▓ ▒██▒░██░░ ████▓▒░  ▒██▒ ░  \n"
  echo -en "░ ▒▓ ░▒▓░░▓  ░ ▒░▒░▒░   ▒ ░░  \n"
  echo -en "  ░▒ ░ ▒░ ▒ ░  ░ ▒ ▒░     ░  \n"
  echo -en "  ░░   ░  ▒ ░░ ░ ░ ▒    ░  \n"
  echo -en "   ░      ░      ░ ░  "$g"\n"
}
case $ran in
1) bn ;;
2) bn1 ;;
3) bn2 ;;
4) bn3 ;;
esac
