if [ -n "$1" ]
then
	echo "OK" > "$1"
	sleep 100

fi

if [ "$1" = "install" ]
then
	echo ts
fi
