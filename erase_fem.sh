#! /bin/bash

export PATH=${PATH}:/opt/codesourcery/arm-2012.03/bin
arm-none-eabi-gdb -command=~/local/gdb_scripts/stellaris_gdb_erase_cmds.txt
