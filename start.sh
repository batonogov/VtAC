#!/bin/sh

mkdir /tmp/lan

until mount -t cifs $CIFS_PATH /tmp/lan -o user=$CIFS_USER,password=$CIFS_PASS
do
    sleep 60
done

cd /tmp/lan

until python3 /convert.py
do
    sleep 60
done

umount /tmp/lan && rm -rf /tmp/lan
