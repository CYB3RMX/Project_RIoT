#!/usr/bin/env python3

# Banner grabber script

import socket,sys,os

sock=socket.socket()

host=str(sys.argv[1])
port=int(sys.argv[2])

sock.connect((host,port))
try:
   data=str(sock.recv(1024).decode("ascii"))
   print(data)
except UnicodeDecodeError:
   print("Couldn't get banner information...")
sock.close()
