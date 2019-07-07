#!/usr/bin/env python

# Checking dependencies script

try:
   import pycvesearch
except ModuleNotFoundError:
   print("[!] Error: You should install >pycvesearch< module to use this tool")
   print("[+] Try: >git clone https://github.com/cve-search/PyCVESearch< then >python setup.py install<")
