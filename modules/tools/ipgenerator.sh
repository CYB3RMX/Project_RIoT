#!/bin/bash

# IP Address generator for RIoT

ip0=$((( $RANDOM % 254 )+1))
ip1=$((( $RANDOM % 254 )+1))
ip2=$((( $RANDOM % 254 )+1))
ip3=$((( $RANDOM % 254 )+1))

newip="$ip0.$ip1.$ip2.$ip3"

echo $newip > temp.txt

case $1 in
--random) echo $newip ;;
esac
