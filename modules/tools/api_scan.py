#!/usr/bin/env python

import os,zoomeye
from shodan import Shodan

# Menu
print("<\033[96m{ \033[92mAPI Scanner \033[96m}\033[0m>\n")
print("\033[91m1 \033[92m) \033[0mHost scan")
print("\033[91m2 \033[92m) \033[0mDork scan")
print("\033[91m3 \033[92m) \033[0mScan selected target \n")
choose=int(input("\033[96m[\033[91m+\033[96m] \033[0mChoose: "))
if choose==1:
   target=raw_input("\033[96m[\033[91m+\033[96m] \033[0mEnter target: ")
   print("\033[96m========== \033[92mScanning\033[0m %s \033[92mwith Shodan \033[96m==========\033[0m \n"%(target))
   os.system("shodan host "+target)
elif choose==2:
   dork=raw_input("\033[96m[\033[91m+\033[96m] \033[0mEnter dork: ")
   print("\033[96m========== \033[92mScanning\033[0m %s \033[92mdork with Shodan \033[96m==========\033[0m \n"%(dork))
   with open('apikeys/shodan.txt', 'r') as file:
      api_key = file.read().replace('\n', '')
   api = Shodan(api_key)
   for targets in api.search_cursor(dork):
      print(targets['ip_str'])
   print("\033[96m========== \033[92mScanning\033[0m %s \033[92mdork with ZoomEye \033[96m==========\033[0m \n"%(dork))
   zoom = zoomeye.ZoomEye()
   with open('apikeys/zoomuser.txt') as zfile:
      zoomuser = zfile.read().replace('\n', '')
   zoom.username = zoomuser
   with open('apikeys/zoompass.txt') as pfile:
      zoompass = pfile.read().replace('\n', '')
   zoom.password = zoompass
   logs = zoom.login()
   data = zoom.dork_search(dork)
   zoomeye.show_site_ip(data)
elif choose==3:
   with open('temp.txt', 'r') as file:
      specified=file.read().replace('\n', '')
   print("\033[96m========== \033[92mScanning\033[0m %s \033[92mwith Shodan \033[96m==========\033[0m \n"%(specified))
   os.system("shodan host "+specified)
else:
   print("\033[96m[\033[91m!\033[96m] \033[0mWrong option :(.")
