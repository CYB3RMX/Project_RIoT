#!/usr/bin/env python

# Checking dependencies script

import os
os.system("command -v nmap > /dev/null 2>&1 || { echo >&2 'This program needs nmap. Please install it to use this tool.' ; exit 1; }")
os.system("command -v curl > /dev/null 2>&1 || { echo >&2 'This program needs curl. Please install it to use this tool.' ; exit 1; }")
try:
   import untangle
except ImportError:
   os.system("pip3 install untangle")
