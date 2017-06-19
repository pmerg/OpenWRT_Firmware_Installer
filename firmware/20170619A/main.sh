if [ -n "$1" ]
then
	echo "OK" > "$1"
	sleep 1

fi

if [ "$1" = "install" ]
then
	echo ts
fi
