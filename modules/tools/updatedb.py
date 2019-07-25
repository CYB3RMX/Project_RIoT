#!/usr/bin/env python

# Database updating script.
from tqdm import tqdm
import requests,os
import math

local_cve_db = "cve_db.xml"
url = "https://cve.mitre.org/data/downloads/allitems.xml"
print("\033[96m[\033[91m+\033[96m]\033[0m Removing old database.")
os.system("rm -rf cve_db.xml")
# Streaming, so we can iterate over the response.
r = requests.get(url, stream=True)

# Total size in bytes.
total_size = int(r.headers.get('content-length', 0));
block_size = 1024
wrote = 0
print("\033[96m[\033[91m+\033[96m]\033[0m Downloading new database please wait...")
with open(local_cve_db, 'wb') as file:
    for data in tqdm(r.iter_content(block_size), total=math.ceil(total_size//block_size) , unit='KB', unit_scale=True):
        wrote = wrote  + len(data)
        file.write(data)
print("\033[96m[\033[91m+\033[96m]\033[0m Download complete.")
if total_size != 0 and wrote != total_size:
    print("ERROR, something went wrong")
