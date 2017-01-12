#! /bin/bash

BIN_DIR=$DEVDIR/fs/fs/bin
LOCAL_DIR=~/local/gdb_scripts/remote
REMOTE_GDB=debugLaunchTarget.sh
ELF_TO_DEBUG=$DEVDIR/fs/fs/usr/bin/libspiclient-fpga-test

if [! -e $BIN_DIR/$REMOTE_GDB ] ; then
    cp $LOCAL_DIR/$REMOTE_GDB $BIN_DIR/
fi
chmod +x $BIN_DIR/$REMOTE_GDB

chmod +rx $ELF_TO_DEBUG
ls -l $ELF_TO_DEBUG

echo
echo "Ensure dmApp doesn't start automatically on boot by commenting it out of the $DEVDIR/fs/fs/etc/init.d/dmApp file."
echo "Start the dmApp using the $REMOTE_GDB command on the target."
read -p "Press enter to continue ..."

echo
echo
echo
arm-none-linux-gnueabi-gdb -command=~/local/gdb_scripts/dm_gdb_cmds.txt $ELF_TO_DEBUG
