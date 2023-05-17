#!/usr/bin/sh -x

cd /run/media/mmcblk0p1/customapps/doukutsu-rs_linux/

rm -Rf doukutsu-rs.x86_64.elf LICENSE

aria2c "https://ci.appveyor.com/api/projects/alula/doukutsu-rs/artifacts/doukutsu-rs_linux.zip?branch=master&job=linux-x64"

unzip doukutsu-rs_linux.zip
rm -Rf doukutsu-rs_linux.zip

chmod +x doukutsu-rs.x86_64.elf
