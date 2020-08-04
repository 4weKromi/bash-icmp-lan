# bash-icmp-lan 
## v0.1

By 4wekromi

https://github.com/4weKromi/bash-icmp-lan

Monitor device status from web browser.

### Tools :
bash, awk, ping, json.

### Instructions :
 - Copy files to web server directory. ( eg: /var/www/ )
 
 - Edit/assigned device ip and name. ( run_device_monitor.sh )
 
 - Check permissions for execution.
 
 - ./run_device_monitor.sh ( bash terminal )
 
 - Open browser, goto bash-icmp-lan/prod/ directory. ( eg: localhost/bash-icmp-lan/prod/index.html )
 
 ![screenshot-img](/res/Screenshot-00.png?raw=true "Screenshot 00")
 
 ### Notes :
 - ping & awk generates text files ping_report.txt, temp_1, temp_mod (incomplete json format)
 - user_ip_status.json contains latest generated json. 
