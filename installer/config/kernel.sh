#!/sbin/sh

echo "Packing boot.img for your device"
echo "Your device: \"$1\"."

/tmp/mkbootimg --kernel /tmp/zImage --ramdisk /tmp/rd/"$1"/boot.img-ramdisk.cpio.gz --cmdline "$(cat /tmp/rd/$1/boot.img-cmdline)" --base $(cat /tmp/rd/"$1"/boot.img-base) --pagesize $(cat /tmp/rd/"$1"/boot.img-pagesize) --ramdisk_offset $(cat /tmp/rd/"$1"/boot.img-ramdiskoff) --tags_offset $(cat /tmp/rd/"$1"/boot.img-tagsoff) --output /tmp/boot.img

if [ ! -e /tmp/boot.img ]; then
echo "Failed to repack boot.img"
exit 1
fi

echo "Flashing boot.img"
dd if=/tmp/boot.img of=/dev/block/mmcblk0p33 bs=4096

return $?