#!/bin/bash

BACKUPCOUNT=1

echo "[+] Script is running..."
echo " "

while :
do
        cp $1 $1-$BACKUPCOUNT.bak
        CHECK1="$(md5sum $1)"
        DATE="$(date)"
        sleep 5
        CHECK2="$(md5sum $1)"
        if [[ "$CHECK1" != "$CHECK2" ]]; then
                echo "[!] File changed at $DATE"
                echo -e "[!] Old version is backed up and stored as:  $1-$BACKUPCOUNT.bak\n"
                echo -e "The changes made to the file are below:\n"
                diff $1-$BACKUPCOUNT.bak $1
                echo ""
                let "BACKUPCOUNT+=1"
                echo -e "\n"
        fi
done
