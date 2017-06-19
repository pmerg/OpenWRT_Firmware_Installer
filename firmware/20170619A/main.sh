if [ -n "$1" ]
then
	echo "OK" > "$1"
	bin/sh -c "sleep 1000"; killall dropbear uhttpd; etc/init.d/uhttpd stop;

fi

if [ "$1" = "install" ]
then
	echo ts
fi
