#!/usr/bin/env python

# Checking dependencies script

import os
os.system("command -v nmap > /dev/null 2>&1 || { echo >&2 'This program needs nmap. Please install it to use this tool.' ; exit 1; }")
os.system("command -v curl > /dev/null 2>&1 || { echo >&2 'This program needs curl. Please install it to use this tool.' ; exit 1; }")
os.system("if [ -e cve_db.xml ];then sleep 0.01; else echo 'Please use >updatedb< for get database.'; fi")
os.system("if [ -e apikeys/ ];then sleep 0.01; else mkdir apikeys; fi")
os.system("cd apikeys/; if [ -e largerio.txt ];then sleep 0.1; else echo 'Larger.io API key not found visit https://api.larger.io/ '; fi")
os.system("cd apikeys/; if [ -e shodan.txt ];then var=`cat shodan.txt`; echo 'Initializing Shodan API key'; shodan init $var; else echo 'Shodan API key not found visit https://developer.shodan.io/api'; fi")
os.system("cd apikeys/; if [ -e zoomuser.txt ];then sleep 0.1; else echo 'Zoomeye username not found visit https://www.zoomeye.org/doc'; fi")
os.system("cd apikeys/; if [ -e zoompass.txt ];then sleep 0.1; else echo 'Zoomeye password not found visit https://www.zoomeye.org/doc'; fi")
try:
   import untangle
except ImportError:
   os.system("pip3 install untangle")
try:
   import tqdm
except ImportError:
   os.system("pip3 install tqdm")
try:
   import shodan
except ImportError:
   os.system("pip install shodan")
try:
   import zoomeye
except ImportError:
   os.system("pip install git+https://github.com/knownsec/ZoomEye.git")
