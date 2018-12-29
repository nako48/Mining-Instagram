#!/bin/bash
mining(){
getfoll && getbalance
curl=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/3.10.0' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=order.get&device_id=ff9368f78e3160e2_26&device_hash=1a0fdba1644df894fb8eb56b34ae72d3" -L)
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
follow=$(curl -s 'http://followers.interinstplus.com/api.php' -H 'User-Agent: okhttp/3.10.0' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=order.follow&device_id=ff9368f78e3160e2_26&device_hash=1a0fdba1644df894fb8eb56b34ae72d3&order_id=$getdata&user_id=$folowerid&skip=0&info=ok")
}
getbalance(){
balance=$(curl -s 'http://followers.interinstplus.com/api.php' 'User-Agent: okhttp/3.10.0' -H 'Content-Type: application/x-www-form-urlencoded' --data "method=balance.get&device_id=ff9368f78e3160e2_26&device_hash=1a0fdba1644df894fb8eb56b34ae72d3")
getbalance=$(echo $balance | grep -Po '(?<=balance":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g') 
}
for (( i = 0; i < 999999999; i++ )); do 
mining 
done