# Linux-Admin-Essentials
Simple scripts to simplify the job of a Linux System Administrator.
Navig.sh will show basic information about the user's current environment
Newusrandgrp.sh will simplify the creation of a new group and new user and making the new group the primary group of the new user
Delusrandgrp.sh will simplify the deletion of a User and a Group
Hwscript.sh will show the majority of available hardware in the computer
Loops were used in Newusrandgrp.sh and Delusrandgrp.sh to remind the script user if a problem has occurred with the process being executed and asks them to make new entries as a result
Note: Make sure these scripts have execute permissions (otherwise, you cannot execute them)
If you don't know or don't remember how to do this, just type: chmod +x *filename*
In order to execute, you need to be in the directory that you have the file in and type the following: ./*filename*
However, if you don't want to type the ./ then you can move the file to the /bin directory (or another directory that is shown in the PATH variable) by typing: mv *filename* *newlocation*
