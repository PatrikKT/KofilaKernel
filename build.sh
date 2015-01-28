#!/bin/bash

#Check if toolchain PATH is set
type -P arm-eabi-gcc &>/dev/null || { echo -e 'Toolchain path not set! \nSet it by running \nexport PATH=<path_to_toolchain>/bin:$PATH'; exit 1; }

tput setaf 6
echo -e "\nSetting variables"
tput sgr0
export ARCH=arm
export CROSS_COMPILE=arm-eabi-

tput setaf 6
echo -e "\nStarting compilation\n"
tput sgr0
make -j8 zara_defconfig
make -j8

#Check if the kernel has been compiled successfuly
if [ ! -e arch/arm/boot/zImage ]; then
	tput setaf 1
	echo "Compilation failed"
	tput sgr0
	exit 1
fi

#Copy zImage
cp arch/arm/boot/zImage installer/boot/zImage

#Copy modules
for m in $(find . -name "*.ko"); do
	cp $m installer/system/lib/modules/
done

#Pack the installer
ZIP_NAME=Kofila-Installer-Zara-V3.zip
if [ -e $ZIP_NAME ]; then
	rm -r $ZIP_NAME
fi
cd installer
zip -r ../$ZIP_NAME * > /dev/null
cd ..

tput setaf 2
echo -e "\nPackage completed: $ZIP_NAME"
tput sgr0
exit 0
