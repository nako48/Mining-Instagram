#!/bin/bash
banner(){
	printf "${GREEN}
	####################################
	####################################
	#######                      #######
	#######                      #######${BLUE}
	####### www.tatsumi-crew.net #######
	###############      ###############
	###############      ###############
	###############      ###############
	###############      ###############${RED}
	#######    ####      ####    #######
	#######    ####      ####    #######
	#######    ##############    #######
	#######    ##############    #######
	#######                      #######
	####################################
	####################################${NOCOLOR}
	------------------------------------
               NAKO MINING KUY
	------------------------------------
"
}
mining(){
getfoll && getbalance
curl=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=order.get&device_id=$deviceid&device_hash=$devicehash" -L)
getdata=$(echo $curl | grep -Po '(?<=id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
username=$(echo $curl | grep -Po '(?<=user_name":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
folowerid=$(echo $curl | grep -Po '(?<=follower_id":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
if [[ $curl =~ "photo_url" ]]; then
printf "Ambil => Balance $getbalance\n" 
else
printf "Ambil => Belance Gagal\n" 	
fi
}
getfoll(){
satudigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 1 | head -n 1)
duadigit=$(cat /dev/urandom | tr -dc '0-9' | fold -w 2 | head -n 1)
deviceid="masukan device id" #set 
devicehash="masukan device hash" #set
follow=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=order.follow&device_id=$deviceid&device_hash=$devicehash&order_id=$getdata&user_id=$folowerid&skip=0&info=ok")
}
getbalance(){
balance=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/'$satudigit'.'$satudigit'.'$satudigit'.'$duadigit'' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=balance.get&device_id=$deviceid&device_hash=$devicehash")
getbalance=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g') 
}
banner
for (( i = 0; i < 9999999; i++ )); do
mining 
done
