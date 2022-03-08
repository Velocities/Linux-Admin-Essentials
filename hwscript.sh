#!/bin/bash

DEF_GATE=`ip r | grep 'default via' | awk '{print $3}'`
#Addresses the user#
echo "Hello $USERNAME"
#Lists the Linux Distribution and version#
echo -n "Operating System: "; cat /etc/os-release | grep -w PRETTY_NAME | cut -d= -f2 | cut -d\" -f2 | cut -d\" -f1
#Lists CPU/processor name#
echo -n "Processor:"; lscpu | grep 'Model name' | cut -d: -f2
#Lists RAM usage, total space, and usable space#
echo -n "Memory:"; free -th | head -2 | cut -d: -f2
#Lists total storage recognized by the PC#
echo -n "Storage:"; lsblk | grep 'disk' | awk '{print $1" "$4}'
#Lists video/graphics cards information#
echo -n "Graphics:"; lspci | grep -i vga | cut -d: -f3
#Lists default gateway/router#
echo -n "Default Gateway: $DEF_GATE"
#Lists the PC's IPv4 and IPv6 address#
echo -n "IPv4 Address:"; ip addr | grep "scope" | grep -vw "lo" | grep -v "host" | grep -w 'inet' | awk '{print $2}' | cut -d/ -f1
echo -n "IPv6 Address:"; ip addr | grep "scope" | grep -vw "lo" | grep -v "host" | grep -w 'inet6' | awk '{print $2}' | cut -d/ -f1
#Tests functionality of TCP/IP, then the connection to the network and connection to the internet#
echo "Loopback adapter test results:"; ping -c4 127.0.0.1 | tail -2
echo "Default Gateway test results:"; ping -c4 $DEF_GATE
echo "Internet connection test results:"; ping -c4 1.1.1.1 | tail -2
#Acknowledges the completion of the script#
echo "Script Complete"
