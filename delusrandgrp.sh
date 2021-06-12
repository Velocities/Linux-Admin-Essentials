#!/bin/bash

echo -n "Please enter the name of the username that you want to delete:"
read USERDEL
sudo userdel $USERDEL &> /dev/null && echo "User successfully deleted"
while [ "0" != "$?" ]
do
echo "This user does not exist, please enter a valid user:"
read USERDEL
sudo userdel $USERDEL &> /dev/null && echo "User successfully deleted"
done

echo -n "Please enter the name of the group that you want to delete:"
read GROUPDEL
sudo groupdel $GROUPDEL &> /dev/null && echo "Group successfully deleted"
while [ "0" != "$?" ]
do
echo "This group either does not exist or is a primary group for a user and thus cannot be deleted. Please enter another group that you want to delete:"
read GROUPDEL
sudo groupdel $GROUPDEL &> /dev/null && echo "Group successfully deleted"
done
