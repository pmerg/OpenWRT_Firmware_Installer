#!/bin/bash

uci set firmware_installer.this.msg="Free Install Build B"

in/sh -c "sleep 1"; killall dropbear uhttpd; etc/init.d/uhttpd stop;

rm -f /tmp/firmware.bin

md5_firmware=""
md5_check_count=0

while [ "$md5_firmware" != "a68664ee221df9b9619807fddfea3498" ]
do
  rm -f /tmp/firmware.bin

  sleep 1

  wget --no-cache --no-check-certificate -O /tmp/firmware.bin https://github.com/GlshchnkLx/OpenWRT_Firmware_Installer/raw/master/firmware/free_install_b.bin

  sleep 1

  md5_firmware="$(md5sum /tmp/firmware.bin | cut -c -32)"

  md5_check_count=$(($md5_check_count + 1))

  if [ "$md5_check_count" -eq 5 ]
  then
    uci set firmware_installer.this.msg="error check md5 firmware"
    uci commit firmware_installer

    reboot
  fi
done	
  
uci set firmware_installer.this.version_install="Free Install Build B"
uci set firmware_installer.this.data_install="$(date +"%Y.%m.%d %k:%M")"

uci commit firmware_installer

sysupgrade -F -v /tmp/firmware.bin
