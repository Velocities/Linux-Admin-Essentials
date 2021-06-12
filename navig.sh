#!/bin/bash

TODAY=`date`
DIR=`pwd`
DISTRO=`grep -w NAME /etc/os-release | cut -d= -f2 | cut -d\" -f2`
VERSION=`grep -w VERSION /etc/os-release | cut -d= -f2 | cut -d\" -f2`
echo "Hello $USERNAME"
echo "Your current working directory is $DIR"
echo "You are on $DISTRO version $VERSION"
echo "The date is $TODAY"