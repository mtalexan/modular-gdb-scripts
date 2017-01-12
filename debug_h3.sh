#! /bin/bash

ELF_TO_DEBUG=$MODULAR_REPO_PATH/build_tmp/h3link_cpa/bin/h3link_base.elf
ls -l $ELF_TO_DEBUG
arm-none-eabi-gdb -command=~/local/gdb_scripts/stellaris_gdb_cmds.txt $ELF_TO_DEBUG
