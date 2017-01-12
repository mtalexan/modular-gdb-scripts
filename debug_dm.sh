#! /bin/bash

LIB_DIR=$DEVDIR/fs/fs
BIN_DIR=$DEVDIR/fs/fs/bin
LOCAL_DIR=~/local/gdb_scripts/remote
REMOTE_GDB=debugLaunchTarget.sh
ELF_TO_DEBUG=$DEVDIR/fs/fs/usr/bin/dmApp
IPADDR=172.22.182.25

if [ ${#} -ge 3 ] ; then
    IPADDR=$3
fi
if [ ${#} -ge 2 ] ; then
    ELF_TO_DEBUG=$2
fi
if [ ${#} -ge 1 ] ; then
    LIB_DIR=$1
fi

# Only if there's no command-line arguments we'll copy the the remote debugging script to the $DEVDIR
if [ ${#} -eq 0 ] ; then
    if [ ! -e $BIN_DIR/$REMOTE_GDB ] ; then
        cp $LOCAL_DIR/$REMOTE_GDB $BIN_DIR/
    fi
    chmod +x $BIN_DIR/$REMOTE_GDB
fi

# Make sure the dmApp elf file is accessible
chmod +rx $ELF_TO_DEBUG
ls -l $ELF_TO_DEBUG

echo
echo "Ensure dmApp doesn't start automatically on boot"
echo "Start the dmApp using the $REMOTE_GDB command on the target."
read -p "Press enter to continue ..."

# if they already provided it as a command line option, don't prompt again
if [ ${#} -lt 3 ] ; then
    echo
    echo -n "IP address of the box [${IPADDR}]: "
    read  INPUTIP
    echo
    echo
    
    if [ -n "$INPUTIP" ] ; then
        IPADDR=$INPUTIP
    fi    
fi

echo "Connecting to IP address ${IPADDR}"

arm-none-linux-gnueabi-gdb -ex "set solib-absolute-prefix ${LIB_DIR}" -ex "target remote ${IPADDR}:2345"  $ELF_TO_DEBUG
