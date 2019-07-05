#!/usr/bin/env python

import os,sys

try:
   import pycvesearch
   from pycvesearch import *
except ModuleNotFoundError:
   os.system("git clone https://github.com/cve-search/PyCVESearch")
   os.system("cd PyCVESearch; chmod 777 setup.py; ./setup.py")

query=str(sys.argv[1])
cve = CVESearch()
output=str(cve.search(query))
print(output)
