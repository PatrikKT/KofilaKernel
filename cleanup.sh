#!/bin/bash

make clean mroproper &> /dev/null
rm -r installer/system/lib/modules/* installer/boot/zImage Kofila-Installer-Zara-*.zip &> /dev/null

tput setaf 2
echo "Done"
tput sgr0
exit 0
