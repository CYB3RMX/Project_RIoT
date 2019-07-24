#!/bin/bash

# CVE and exploit search engine.

cyan='\e[96m'
red='\e[91m'
green='\e[92m'
default='\e[0m'
yellow='\e[93m'

echo -en "$cyan[$red+$cyan]$default Enter your query: "
read query
./cvesearch.py -s "$query"
