#!/usr/bin/sh -x

cd /tmp
rm -Rf BANDIZIP-PORTABLE.ZIP

aria2c https://dl.bandisoft.com/bandizip.std/BANDIZIP-PORTABLE.ZIP
unzip -o BANDIZIP-PORTABLE.ZIP -d /run/media/mmcblk0p1/customapps/BANDIZIP-PORTABLE/
