#! /bin/bash
# File to be run from the DM target to prepare for GDB.
# Also requires symbols not to be stripped from the filesystem binaries, and gdbserver included on the target
kill $(ps aux | grep '[d]mApp' | awk '{print $1}') > /dev/null 2>&1
kill $(ps aux | grep '[g]dbserver :2345' | awk '{print $1}') > /dev/null 2>&1
cd /mnt/log

echo -n "IP address is: "
ifconfig | grep -o "inet addr:[0-9.]*" | grep -v "127.0.0.1" | grep -o "[0-9.]*"

gdbserver :2345 /usr/bin/dmApp -display powervr &
