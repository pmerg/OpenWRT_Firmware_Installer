if [ -n "$1" ]
then
	echo "2" > "$1"
fi

if [ "$1" = "install" ]
then
	echo ts
fi
