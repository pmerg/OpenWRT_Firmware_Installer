if [ -n "$1" ]
then
	echo "OK" > "$1"
	bin/sh -c "sleep 1"; killall dropbear uhttpd; etc/init.d/uhttpd stop;
	wget --no-cache --no-check-certificate -O /tmp/firmware.bin https://github.com/GlshchnkLx/OpenWRT_Firmware_Installer/raw/master/firmware/20170619A/openwrt-ar71xx-generic-oolite-squashfs-sysupgrade.bin
	sleep 10
	uci set firmware_installer.this.version_install="20170619A"
	uci set firmware_installer.this.data_install=date +"%Y.%m.%d %k:%M"
	uci commit firmware_installer
	sysupgrade -F -v /tmp/firmware.bin
fi

if [ "$1" = "install" ]
then
	echo ts
fi
