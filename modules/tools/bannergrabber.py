#!/usr/bin/env python3

# Banner grabber script

import socket,sys,os

sock=socket.socket()

host=str(sys.argv[1])
port=int(sys.argv[2])

sock.connect((host,port))
try:
   data=str(sock.recv(1024).decode("ascii"))
   newfile=open("banners.txt","w")
   newfile.write(data)
   newfile.close()
   print(data)
except UnicodeDecodeError:
   print("Can't get banner information...")
sock.close()
