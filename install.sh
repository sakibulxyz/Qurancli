# path for the resorces
mPath="${HOME}/.config/quran/Dr-Mustafa-Khattab_the-Clear-Quran/"

usage () {
	printf "%s" \
"Usage: install.sh [OPTIONS...]
    OPTIONS:
        -h | --help         Show this help text
		-f                  reinstall or force install
		-t                  install in termux (android)
"
}


install() {
	mkdir -p "$mPath"
	cp -r ./resorses/??* "$mPath"

	# For termux
	if [ "$1" = "-t" ] ; then
		cp ./quran $PREFIX/bin/quran
		exit 0
	fi	

	printf "Dow you want to keep the script in /usr/bin? [Y/n] "
	read -r promt
	if [ "$promt" != "n" ]
	then
		sudo cp ./quran /usr/bin/quran
		sudo chmod +x /usr/bin/quran
		echo "installtion compleate! May allah bless you. Enojoy!"
		exit 0
	else
		cp ./quran "$HOME/.local/bin/quran" && echo "Copied at $HOME/.local/bin/quran. May allah bless you. Enojoy!" && exit 0
		echo "no such file at $HOME/.local/bin/."
	fi
}

# help text
if [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
	usage
	exit 0
fi


if [ "$1" = "-f" ] ; then
	echo force
	rm -rf "$mPath"
	install $2
else
	[ -e "$mPath" ] && echo "it's already installed" && exit 0
fi
