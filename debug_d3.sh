#! /bin/bash

export PATH=${PATH}:/opt/codesourcery/arm-2012.03/bin
ELF_TO_DEBUG=$MODULAR_REPO_PATH/build_tmp/d3link_cpa/bin/hddm_base.elf
ls -l $ELF_TO_DEBUG
arm-none-eabi-gdb -command=~/local/gdb_scripts/stellaris_gdb_cmds.txt $ELF_TO_DEBUG
