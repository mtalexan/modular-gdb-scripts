#!/bin/bash



ELF_TO_DEBUG=${DEVDIR}/myapps/ksi-dmapp/src/bin/arm/dmApp
PATH_TO_LIBS=${DEVDIR}/fs/fs/
CORE_FILE=

if [ ${#} -eq 3 ] ; then
    ELF_TO_DEBUG=$1
    CORE_FILE=$2
    PATH_TO_LIBS=$3
elif [ ${#} -eq 2 ] ; then
    CORE_FILE=$1
    PATH_TO_LIBS=$2
elif [ ${#} -eq 1 ] ; then
    CORE_FILE=$1
else
    echo "USAGE: $0 <pathed exec> <core> <lib root path>"
    echo "          <core> <lib root path>"
    echo "          <core>"
    echo "With the reduced argument sets, the defaults for the other arguments are to look in the normal location under DEVDIR"
    exit 1
fi

chmod +rx $ELF_TO_DEBUG
ls -l $ELF_TO_DEBUG

echo "Running: arm-none-linux-gnueabi-gdb -ex \"set solib-absolute-prefix $PATH_TO_LIBS\" $ELF_TO_DEBUG  -c $CORE_FILE"
arm-none-linux-gnueabi-gdb -ex "set solib-absolute-prefix $PATH_TO_LIBS" $ELF_TO_DEBUG  -c $CORE_FILE
