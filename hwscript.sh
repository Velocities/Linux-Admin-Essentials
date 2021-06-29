#!/bin/bash

#Addresses the user#
echo "Hello $USERNAME"
#Lists the Linux Distribution and version#
echo -n "You are on "; cat /etc/os-release | grep -w PRETTY_NAME | cut -d= -f2 | cut -d\" -f2 | cut -d\" -f1
#Lists CPU/processor name#
echo -n "Processor:"; lscpu | grep 'Model name' | cut -d: -f2
#Lists RAM usage, total space, and usable space#
echo -n "Memory:"; free -th | head -2 | cut -d: -f2
#Lists total storage recognized by the PC#
echo -n "Storage:"; lsblk | grep 'disk' | awk '{print $1" "$4}'
#Lists video/graphics cards information#
echo -n "Graphics:"; lspci | grep -i vga | cut -d: -f3
#Tests functionality of the Network Card/NIC and then the connection to the network#
echo "Loopback adapter test results:"; ping -c4 127.0.0.1 | tail -2
echo "Internet connection test results:"; ping -c4 1.1.1.1 | tail -2
#Lists default gateway/router#
echo -n "Default Gateway:"; ip route | grep 'default via' | awk '{print $3}'
#Lists the PC's IPv4 and IPv6 address#
echo -n "IPv4 Address:"; ip addr | grep "scope" | grep -vw "lo" | grep -v "host" | grep -w 'inet' | awk '{print $2}' | cut -d/ -f1
echo -n "IPv6 Address:"; ip addr | grep "scope" | grep -vw "lo" | grep -v "host" | grep -w 'inet6' | awk '{print $2}' | cut -d/ -f1
#Acknowledges the completion of the script#
echo "Script Complete"
