#!/bin/bash

# Banner filtering script

banner_array=(`cd ..; cd keywords; cat bannerz.txt`)

if [ -e banners.txt ];then
  for bann in ${banner_array[*]}
  do
     cat banners.txt | grep -o $bann &>/dev/null
     if [ $? -eq 0 ];then
       echo $bann > targetbanner.txt
     fi
  done
else
  echo "Cant get banner information..."
fi
