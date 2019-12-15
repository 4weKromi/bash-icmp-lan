#!/bin/bash
# Device Monitor v0.1 by 4wekromi
# 28/10/2019
# https://github.com/4weKromi

while [ 1 ]
do
	iter=0;
	#ip_user_list=(system system internet);
	#assigned device name below
	ip_user_list[0]="Device 1";
	ip_user_list[1]="Device 2";
	#ip_list=(127.0.0.1 localhost google.com);
	#assigned device ip below
	ip_list[0]="192.168.0.2";
	ip_list[1]="192.168.0.3";
	loop=`expr ${#ip_list[@]} - 1` # initial array index 0
	echo "[" > temp_mod # creates a new draft json

	while [ $iter -le $loop ] 
	do
		ip_user=${ip_user_list[$iter]}
		ping  -i 0.2 -s 0 -c 1 ${ip_list[$iter]} | grep "PING" > ping_report.txt
		ping  -i 0.2 -s 0 -c 1 ${ip_list[$iter]} | grep "ttl" >> ping_report.txt
		ip_addr=`awk 'NR==1 {print $2}' ping_report.txt` # line 1 : 2nd word
		echo "_" $ip_addr
		ttl=`awk 'NR==2 {print $NF}' ping_report.txt` # line 2 : last word
		check=0;
		if [ -z "$ttl" ] # if not assigned
		then
			check_ttl=0;
		else
			check_ttl=1;
		fi
		if [ -z "$ip_addr" ] 
		then
			ip_addr=${ip_list[$iter]}
		fi

		iter=`expr $iter + 1`;

		if [ $iter -le $loop ]
		then
			echo "{\"user\": \"$ip_user\",\"ip\": \"$ip_addr\",\"status\": \"$check_ttl\"}," > temp_1 # with ,
		else
			echo "{\"user\": \"$ip_user\",\"ip\": \"$ip_addr\",\"status\": \"$check_ttl\"}" > temp_1 # w/o ,
		fi
		cat temp_1 >> temp_mod;
	done
	echo "]" >> temp_mod
	cat temp_mod > user_ip_status.json; # write prepared json to final json
done
