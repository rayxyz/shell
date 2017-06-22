#!/bin/bash
echo "Date: `date`"
echo "Initiating scann..."
nmap -sP 192.168.1.1/24 | grep report | awk '{print $5}' -> 001output.txt
echo "Commands complete."
