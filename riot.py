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
commands=["get_location", "port_lookup", "clear", "check_proxy", "router", "camera", "printer", "air_sys", "get_banners", "exit", "facility_systems", "whatis", "help", "credits", "webtech", "osGuess", "set_target", "cve_search", "updatedb", "mac_vlookup", "add_key", "api_scan"]
creds='''
    ■■■■■■■■■■■■■■■■                                                                 +---------------------------------------------+
             ■■■■■         Thank you for using RIoT Project (^-^) <3                 | Legal disclaimer: Usage of RIoT for         |
           ■■■■                                                                      | scanning targets without prior mutual       |
       ■■■■                        Developer: CYB3RMX_ | cyb3rmx0@gmail.com          | consent is illegal. It is the end user's    |
         ■■■■■■■■                                                                    | responsibility to obey all applicable local |
            ■■■      Thanks_for=["Shodan", "Zoomeye",                                | state and federal laws. Developers assume   |
     ■     ■■■                   "Larger.io",                                        | no liability and are not responsible for    |
      ■  ■■                      "https://github.com/highmeh"]                       | any misuse or damage caused by this tool.   |
       ■■                                                                            +---------------------------------------------+
     ■■  ■                     Please give me a feedback to improve RIoT Project.
   ■■     ■
'''
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
      print("--------------------------------COMMANDS_LIST---------------------------------")
      print("|Commands        | Descriptions                                              |")
      print("------------------------------------------------------------------------------")
      print("|add_key         | Add an API key to modules.                                |")
      print("|air_sys         | Scan target with Air System Detection Script.             |")
      print("|api_scan        | Get more information about target using various API\'s.    |")
      print("|camera          | Scan target with Camera Detection Script.                 |")
      print("|check_proxy     | Scan target\'s proxy ports.                                |")
      print("|clear           | Clears the screen.                                        |")
      print("|credits         | Credits for the project RIoT.                             |")
      print("|cve_search      | Search CVE or exploit.                                    |")
      print("|exit            | Terminate the program.                                    |")
      print("|facility_systems| Scan target with Facility System Detection Script.        |")
      print("|get_banners     | Get target\'s service names.                               |")
      print("|get_location    | Get target\'s location informations.                       |")
      print("|help            | Print this output :).                                     |")
      print("|mac_vlookup     | Get target\'s mac vendor.                                  |")
      print("|osGuess         | Check target\'s operating system.                          |")
      print("|port_lookup     | Port scan against the target.                             |")
      print("|printer         | Scan target with Printer Detection Script.                |")
      print("|router          | Scan target with Router Detection Script.                 |")
      print("|set_target      | Set a target.                                             |")
      print("|updatedb        | Update RIoT\'s CVE and exploit database.                   |")
      print("|webtech         | Check target\'s web technologies.                          |")
      print("|whatis          | Check device type (e.g. honeypot,cloud,database,...).     |")
      print("------------------------------------------------------------------------------")
   def console():
      try:
         con=str(input("\u001b[0m|RIoT|+> "))
         if con == 'help':
           start_RIoT.helpp()
           start_RIoT.console()
         elif con == 'get_location':
           os.system("cd modules/tools/; ./location.sh")
           start_RIoT.console()
         elif con == 'port_lookup':
           os.system("cd modules/tools/; ./target_recon.sh")
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
         elif con == 'credits':
           print(creds)
           start_RIoT.console()
         elif con == 'exit':
           print("\n{}[{}!{}]{} Program terminated...".format(lc1,lr1,lc1,w1))
           os.system("cd modules/tools/; rm -rf *.txt")
           sys.exit(0)
         elif con == 'cve_search':
           os.system("cd modules/tools/; ./lookfor.sh")
           start_RIoT.console()
         elif con == 'get_banners':
           os.system("cd modules/tools/; ./pxbanner.sh")
           start_RIoT.console()
         elif con == 'whatis':
           os.system("cd modules/tools/; ./what_is.sh")
           start_RIoT.console()
         elif con == 'webtech':
           os.system("cd modules/tools/; ./webtechs.sh")
           start_RIoT.console()
         elif con == 'osGuess':
           os.system("cd modules/tools/; ./OsGuess.sh")
           start_RIoT.console()
         elif con == 'set_target':
           os.system("cd modules/tools/; ./settarget.sh")
           start_RIoT.console()
         elif con == 'mac_vlookup':
           os.system("cd modules/tools/; ./macvendorlookup.sh")
           start_RIoT.console()
         elif con == 'updatedb':
           os.system("cd modules/tools/; ./updatedb.py")
           start_RIoT.console()
         elif con == 'add_key':
           os.system("cd modules/tools/; ./add_key.sh")
           start_RIoT.console()
         elif con == 'api_scan':
           os.system("cd modules/tools/; ./api_scan.py")
           start_RIoT.console()
         else:
           print("\n{}[{}!{}]{} Please use > help < command".format(lc1,lr1,lc1,w1))
           start_RIoT.console()
      except:
         print("\n{}[{}!{}]{} Program terminated...".format(lc1,lr1,lc1,w1))
         os.system("cd modules/tools/; rm -rf *.txt")
# EXECUTION AREA...
os.system("cd modules/tools/; python dependencies.py")
os.system("cd modules/tools/; ./banners.sh")
try:
   start_RIoT.console()
except:
   print("\n{}[{}!{}]{} Program terminated...".format(lc1,lr1,lc1,w1))
   os.system("cd modules/tools/; rm -rf *.txt")
