#!/bin/bash
echo "Date: `date`"
echo "Initiating scann..."
set -x
nmap -sP 192.168.1.1/24 | grep report | awk '{print $5}' -> 001output.txt
set +x
echo "Commands complete."
