#!/usr/bin/env bash

loadAVERAGE=$(uptime | cut -d: -f5)
freeMEM=$(free | grep “Mem” | tr -s “ “ | cut -d” “ -f4)

echo "CPU AND MEMORY RESOURCES---------------------"
echo "CPU Load Average: $loadAVERAGE        Free RAM: $freeMEM"
echo""

loRECEIVED=$(cat /proc/net/dev | grep 'lo' | tr -s " " | cut -d" " -f3)
loTRANSMITTED=$(cat /proc/net/dev | grep 'lo' | tr -s " " | cut -d" " -f11)
eth0RECEIVED=$(cat /proc/net/dev | grep 'enp0s3' | tr -s " " | cut -d" " -f2)
eth0TRANSMITTED=$(cat /proc/net/dev | grep 'enp0s3' | tr -s " " | cut -d" " -f10)

CONNECTED=$(ping -c1 gogole.com | grep 'transmitted' | cut -d" " -f6 | tr -d %)
if [ $CONNECTED -eq 0 ];
then
CONNECTED="YES"
else
CONNECTED="NO"
fi
echo "NETWORK CONNECTIONS------------------------"
echo "lo Bytes Received: $loRECEIVED       Bytes Transmitted: $loTRANSMITTED"
echo "eth0 Bytes Received: $eth0RECEIVED       Bytes Transmitted: $eth0TRANSMITTED"
echo "Internet Connectivity: $CONNECTED"
echo ""

totalUSERS=$(cat /etc/passwd | wd -l)
usersACTIVE=$(who | wc -l)
echo "ACCOUNT INFORMATION-------------------------"
echo "Total Users: $totalUSERS        Number Active: $usersACTIVE"
echo "Most Frequently Used Shell: $SHELL"