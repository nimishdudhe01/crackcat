#!/bin/bash

id | grep "uid=0" > /dev/null
if [ $? -eq 0 ]
then
	echo Hehe > /dev/null
else
	echo -e "Run this script with sudo.\n"
	echo -e "sudo $0"
	exit
fi

echo -n "Do you want to download the rockyou.txt wordlist?(y/n) "
read want_rockyou

if [ "$want_rockyou" == "y" ] || [ "$want_rockyou" == "Y" ]
then
	if [ -d /usr/share/wordlists/ ]
	then
		if [ -f /usr/share/wordlists/rockyou.txt ]
		then
			echo -e 'rockyou.txt already exists.\nWordlist download skipped.'
		elif [ -f /usr/share/wordlists/rockyou.txt.gz ]
		then
				gunzip /usr/share/wordlists/rockyou.txt.gz
		else
			echo [+] Downloading The Wordlist
			wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz -O /tmp/rockyou.txt.gz
			echo [+] Unzipping The Wordlist
			gunzip /tmp/rockyou.txt.gz
			mv /tmp/rockyou.txt /usr/share/wordlists/rockyou.txt
		fi
	else
		mkdir -p /usr/share/wordlists
		echo [+] Downloading The Wordlist
		wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz -O /tmp/rockyou.txt.gz
		echo [+] Unzipping The Wordlist
		gunzip /tmp/rockyou.txt.gz
		mv /tmp/rockyou.txt /usr/share/wordlists/rockyou.txt
	fi
fi

check(){

	which $1 > /dev/null
	if [ $? -eq 0 ]
	then
		echo -n ""
	else
		echo [+] installing Hashcat
		sudo apt-get install hashcat
	fi
}

check hashcat
