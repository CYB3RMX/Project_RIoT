#!/usr/bin/env python

# Checking dependencies script

try:
   import pycvesearch
except ImportError:
   print("[!] Error: You should install > pycvesearch < module to use this tool.")
   print("[+] Try: > git clone https://github.com/cve-search/PyCVESearch < then > cd PyCVESearch/; python setup.py install <")
import os
os.system("command -v nmap > /dev/null 2>&1 || { echo >&2 'This program needs nmap. Please install it to use this tool.' ; exit 1; }")
os.system("command -v curl > /dev/null 2>&1 || { echo >&2 'This program needs curl. Please install it to use this tool.' ; exit 1; }")
try:
   import bs4
except ImportError:
   print("Please install bs4 module to use this program successfully...")
