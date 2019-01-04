#!/bin/bash
#Code By : NakoCoders
#Contact Me : https://www.facebook.com/hxr.id
#Nb : Ga usah recode lah kontol kalau cuman ganti text doang memek
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m' 
PUR='\033[0;35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\033[0m'
banner(){
	printf "
	####################################
	####################################
	#######                      #######
	#######                      #######
	####### www.tatsumi-crew.net #######
	###############      ###############
	###############      ###############
	###############      ###############
	###############      ###############
	#######    ####      ####    #######
	#######    ####      ####    #######
	#######    ##############    #######
	#######    ##############    #######
	#######                      #######
	####################################
	####################################
	------------------------------------
	          NAKO MINING KUYS
	------------------------------------
"
}	
miningfoll(){
	getfoll && getbalance
	ambil=$(curl -s --compressed --cookie ${random}_tmp "http://followers.interinstplus.com/api.php" -L \
	-H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	--data "method=order.get&device_id=$deviceid&device_hash=$devicehash")	
	getdata=$(echo $ambil | grep -Po '(?<=id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	username=$(echo $ambil | grep -Po '(?<=user_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	folowerid=$(echo $ambil | grep -Po '(?<=follower_id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	if [[ $ambil =~ "photo_url" ]]; then
		printf "Ambil => Balance [BERHASIL => $getbalance]\n" 
	else
		printf "Ambil => Balance [GAGAL]\n" 	
	fi
}
getfoll(){
	satudigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)
	duadigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 2 | head -n 1)
	follow=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=order.follow&device_id=$deviceid&device_hash=$devicehash&order_id=$getdata&user_id=$folowerid&skip=0&info=ok")
}
getbalance(){
	balance=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=balance.get&device_id=$deviceid&device_hash=$devicehash")
	getbalance=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g') 
}
mininglike(){
	cekpost && getbalance2
	ambil=$(curl -s --compressed --cookie ${random}_tmp "https://likes.interinstplus.com/api.php" -L \
	-H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	--data "method=photo.get&device_id=$deviceid&device_hash=$devicehash")	
	getdata=$(echo $ambil | grep -Po '(?<=id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	getuserid=$(echo $ambil | grep -Po '(?<=user_id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	photoid=$(echo $ambil | grep -Po '(?<=photo_id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	if [[ $ambil =~ "photo_url" ]]; then
		printf "Ambil => Balance [BERHASIL => $getbalancena]\n" 
	else
		printf "Ambil => Balance [GAGAL]\n" 	
	fi
}
cekpost(){
	satudigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)
	duadigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 2 | head -n 1)
	follow=$(curl -s 'https://likes.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=photo.like&device_id=$deviceid&device_hash=$devicehash&order_id=$getdata&skip=0&info=ok&photo_id=$photoid")
}
getbalance2(){
	balance=$(curl -s 'http://likes.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=balance.get&device_id=$deviceid&device_hash=$devicehash")
	getbalancena=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g') 
}
banner
echo "Method : "
echo "1. Mining Followers" 
echo "2. Mining Likers" 
read -p "Choose Your Method : " pilihan;
if [ $pilihan -eq 1 ]; then
	read -p "Masukan DeviceID : " deviceid
	read -p "Masukan DeviceHash : " devicehash
	for (( ; ; )); do
		miningfoll $deviceid $devicehash
	done
	wait
elif [ $pilihan -eq "2" ]; then
	read -p "Masukan DeviceID : " deviceid
	read -p "Masukan DeviceHash : " devicehash
	for (( ; ; )); do
		mininglike $deviceid $devicehash
	done	
	wait
fi
