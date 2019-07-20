#!/usr/bin/env python

import os,sys,pycvesearch
from pycvesearch import *
try:
   query=str(sys.argv[1])
   cve = CVESearch()
   output=str(cve.search(query))
   print(output)
except IndexError:
   print("=> Couldn't get Banner Information :(")
