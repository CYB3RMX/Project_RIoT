#!/usr/bin/env python

# This script for parsing ssh and html cve's

import requests,sys
from bs4 import BeautifulSoup as bs

try:
   banner = str(sys.argv[1])
   print(u"\u001b[96m[\u001b[91m+\u001b[96m]\u001b[0m Wait while RIoT parsing the available exploit list from shodan...")
   news = "https://exploits.shodan.io/?q=%s" %banner
   page = requests.get(news)
   soup = bs(page.text, 'html.parser')
   ress = soup.find(class_='nine columns')
   ress_item = ress.find_all('a')
   for cve in ress_item:
      for i in range(0,1):
         names = cve.contents[i]
         print(names)
except (AttributeError,IndexError), e:
   print(u"\u001b[96m[\u001b[91mx\u001b[96m]\u001b[0m Couldn't get any data :(..")
