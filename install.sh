mPath="${HOME}/.config/quran/Dr-Mustafa-Khattab_the-Clear-Quran/"

mkdir "$mPath"
cp -r ./resorses/??* "$mPath"

printf "Dow you want to keep the script in /usr/bin? [Y/n] "
read -r promt
if [ "$promt" != "n" ]
then
	sudo cp ./quran /usr/bin/quran
	sudo chmod +x /usr/bin/quran
	echo "installtion compleate! Enjoy!"
	exit 0
else
	cp ./quran "$HOME/.local/bin/quran"
fi

