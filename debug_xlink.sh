#! /bin/bash

ELF_TO_DEBUG=$MODULAR_REPO_PATH/build_tmp/xlink_cpa/bin/xlink_base.elf
ls -l $ELF_TO_DEBUG
arm-none-eabi-gdb -command=~/local/gdb_scripts/stellaris_gdb_cmds.txt $ELF_TO_DEBUG
