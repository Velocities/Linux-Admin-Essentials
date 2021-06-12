#!/bin/bash

#Asks the user to type a name for a new group#
echo -n "Please enter a name for a potentially new group:"
read GROUPNAME
#Tests to see if the group already exists, removes all output from terminal by sending it to /dev/null and asks the user for new input if it does already exist#
cat /etc/group | awk '{print $1}' | grep -w "$GROUPNAME" &> /dev/null
while [ 0 = "$?" ]
do
echo -n "This group exists, please make a new entry:"
read GROUPNAME
cat /etc/group | awk '{print $1}' | grep -w "$GROUPNAME" &> /dev/null
done
sudo groupadd $GROUPNAME && echo "Group has been successfully created"

#Asks the user to type a name for a new user#
echo -n "Please enter a name for a new user:"
read USER
#Tests to see if the user already exists, removes all output from terminal by sending it to /dev/null and asks the user for new input if it does already exist#
id $USER &> /dev/null
while [ 0 = "$?" ]
do
echo -n "This user already exists, please make a new entry:"
read USER
id $USER &> /dev/null
done
sudo useradd -g $GROUPNAME $USER && echo "User has been successfully created with previously created group as its primary"

echo "Please enter a password for your new user:"
sudo passwd $USER
