#!/bin/bash

BACKUPCOUNT=1

echo -e "[+] Script is running...\n"

while :
do
        if test -f "$1-sub2.txt"; then
                cp $1-sub2.txt $1-$BACKUPCOUNT.bak
        fi

        crtsh $1 > $1-sub1.txt
        cat $1-sub1.txt | sort -u > $1-sub2.txt

        CHECK1="$(md5sum $1-sub2.txt)"
        DATE="$(date)"
        sleep 60
        CHECK2="$(md5sum $1-sub2.txt)"
        if [[ "$CHECK1" != "$CHECK2" ]]; then
                echo "[!] SUB DOMAINS CHANGED ON $DATE"
                echo -e "[!] Old version is backed up and stored as:  $1-$BACKUPCOUNT.bak\n"
                echo -e "The changes made to the file are below:\n"
                diff $1-$BACKUPCOUNT.bak $1
                echo ""
                let "BACKUPCOUNT+=1"
                echo -e "\n"
        fi
d
