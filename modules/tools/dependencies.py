#!/usr/bin/env python

# Checking dependencies script

import os
os.system("command -v nmap > /dev/null 2>&1 || { echo >&2 'This program needs nmap. Please install it to use this tool.' ; exit 1; }")
os.system("command -v curl > /dev/null 2>&1 || { echo >&2 'This program needs curl. Please install it to use this tool.' ; exit 1; }")
os.system("if [ -e cve_db.xml ];then echo . &>/dev/null; else echo 'Please use >updatedb< for get database.'; fi")
try:
   import untangle
except ImportError:
   os.system("pip3 install untangle")
try:
   import tqdm
except ImportError:
   os.system("pip3 install tqdm")
