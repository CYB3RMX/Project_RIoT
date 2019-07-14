#!/usr/bin/env python3

#------------COLOR AND FONT AREA-------------@
lg1='\u001b[92m'
lg2='\u001b[102m'
lr1='\u001b[91m'
lr2='\u001b[101m'
lbl2='\u001b[104m'
def2='\u001b[49m'
black1='\u001b[30m'
lc1='\u001b[96m'
ly1='\u001b[93m'
ly2='\u001b[103m'
lm1='\u001b[95m'
w1='\u001b[0m'
defbl='\u001b[49m'

import os,sys,readline,rlcompleter
commands=["get_location", "port_lookup", "clear", "check_proxy", "router", "camera", "printer", "air_sys", "get_cve", "exit", "facility_systems"]
class start_RIoT():
   def completee(con, state):
      options=[i for i in commands if i.startswith(con)]
      if state < len(options):
        return options[state]
      else:
        return None
   readline.parse_and_bind("tab: complete")
   readline.set_completer(completee)
   def helpp():
      print("Usage: python3 riot.py \n")
      print("------------COMMANDS_LIST-------------")
      print("get_location: Get target's location informations.")
      print("port_lookup: Port scan against the target.")
      print("clear: Clears the screen.")
      print("check_proxy: Scan target's proxy ports.")
      print("router: Scan target with router detection script.")
      print("camera: Scan target with camera detection script.")
      print("printer: Scan target with printer detection script.")
      print("air_sys: Scan target with air system detection script.")
      print("get_cve: Get available CVE for target's service names.")
      print("facility_systems: Scan target with facility system detection script.")
      print("exit: Exit the program.")
      print("help: Print this output :).")
      print("--------------------------------------")
   def locator():
      loc="curl -sSL http://ip-api.com/{}".format(targett)
      print("{}=========={}LOCATION_INFO{}=========={}".format(lc1,lg1,lc1,w1))
      os.system(loc)
   def portscanner():
      os.system("cd modules/tools/; ./target_recon.sh")
   def cvescann():
      os.system("cd modules/tools/; ./bannerfilter.sh")
      os.system("cd modules/tools/; ./cvelister.sh")
      start_RIoT.console()
   def console():
      try:
         con=str(input("[RIoT]> "))
         if con == 'help':
           start_RIoT.helpp()
           start_RIoT.console()
         elif con == 'get_location':
           start_RIoT.locator()
           start_RIoT.console()
         elif con == 'port_lookup':
           start_RIoT.portscanner()
           start_RIoT.console()
         elif con == 'cvescan':
           start_RIoT.cvescann()
           start_RIoT.console()
         elif con == 'clear':
           os.system("clear")
           start_RIoT.console()
         elif con == 'check_proxy':
           os.system("cd modules/tools/; ./proxyportcheck.sh")
           start_RIoT.console()
         elif con == 'router':
           os.system("cd modules/tools/; ./routercheck.sh")
           start_RIoT.console()
         elif con == 'air_sys':
           os.system("cd modules/tools/; ./airsystemchek.sh")
           start_RIoT.console()
         elif con == 'printer':
           os.system("cd modules/tools/; ./printerdetect.sh")
           start_RIoT.console()
         elif con == 'camera':
           os.system("cd modules/tools/; ./webcamdetect.sh")
           start_RIoT.console()
         elif con == 'facility_systems':
           os.system("cd modules/tools/; ./facility_sys.sh")
           start_RIoT.console()
         elif con == 'exit':
           print("\n{}[{}!{}]{} Program stopped...".format(lc1,lr1,lc1,w1))
           os.system("cd modules/tools/; rm -rf *.txt")
           sys.exit(0)
         elif con == 'get_cve':
           os.system("cd modules/tools/; ./pxbanner.sh")
           start_RIoT.console()
         else:
           print("\n{}[{}!{}]{} Please use >help< command".format(lc1,lr1,lc1,w1))
           start_RIoT.console()
      except KeyboardInterrupt or EOFError:
         print("\n{}[{}!{}]{} Program stopped...".format(lc1,lr1,lc1,w1))
         os.system("cd modules/tools/; rm -rf *.txt")
# EXECUTION AREA...
os.system("cd modules/tools/; python3 dependencies.py")
os.system("cd modules/tools/; ./banners.sh")
try:
   targett=str(input("\n{}[{}+{}]{} Enter a target: ".format(lc1,lr1,lc1,w1)))
   gett="cd modules/tools/; echo {} > temp.txt".format(targett)
   os.system(gett)
   start_RIoT.console()
except KeyboardInterrupt or EOFError:
   print("\n{}[{}!{}]{} Program stopped...".format(lc1,lr1,lc1,w1))
   os.system("cd modules/tools/; rm -rf *.txt")
