if [ -n "$1" ]
then
	echo 1 > "$1"
fi

if [ "$1" = "install" ]
then
	echo ts
fi
