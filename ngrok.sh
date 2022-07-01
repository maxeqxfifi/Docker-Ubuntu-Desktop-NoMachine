#!/bin/bash
stty intr ""
stty quit ""
stty susp undef

clear
rm -rf ngrok ngrok.exe ng.sh > /dev/null 2>&1
echo "======================="
echo "Pobieranie ngroka..."
echo "======================="
wget -O ngrok.exe https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip > /dev/null 2>&1
run ngrok.exe > /dev/null 2>&1
