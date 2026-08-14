#!/bin/bash

ps | pgrep $$
echo "Running"

BIRTHDAY="MAR 28"

if [ "$BIRTHDAY" == "MAR 8 2004" ]; then
	echo "Its my Birthday"
else 
	echo " $BIRTHDAY. Its Not my birthday"
fi

#--


today=$(date +"%b %d")

if [ "$BIRTHDAY" == "$today" ] ; then
	echo "Its My Bithday today"
else  
	echo "$today is not my birthday"
fi

#---

function file {
	echo "total arg $#"
	echo "arg $*"
	echo "first arg: $1"
}

if [ ! "$#" -lt 1 ] ; then
	file "$*"
	           #Forgot to remove exit 0 , shell is terminating here
fi

#---Array---


#hosts=("8.8.8.8" "1.1.1.1" "192.168.1.99")

#echo "checking ${#hosts[@]} hots.."

#for ip in "${hosts[@]}"; do
#	if ping -c 1 "$ip" &> /dev/null; then
#		echo "$ip is working"
#	else 
#		echo "$ip is not working"
#
#	fi
#done

##  ->>

# 8.8.8.8 is working  ->  Google 
#1.1.1.1 is working  ->  Cloudflare
#192.168.1.99 is not working  ->  private local  192.168

#----Basic Operators -----


if [ "$#" -ne 2 ]; then
	echo "use: *.sh <num1> <num2>"
	exit 1
fi


sum=$(("$1" + "$2"))


echo "sum of $1 and $2 is $sum"

remainder=$((sum % 2))
if [ "$remainder" -eq 0 ]; then
	echo "sum is even"
elif [ "$remainder" -eq 5 ];then
	echo "Just to check elif"
else
	echo "sum is oddd"
fi

#-----String Operations-------
#Read docs
path="/var/log/nginx/access.log /var/log/nginx/error.log"
name="Rohan"

echo "${#path}"
echo "${path}_${name}_is ther"
echo "${path:4:20}"
echo "${path:4}"
echo "${path/nginx/apache}"
echo "${path//nginx/apache}"
echo "${path^^}"
echo "${path,,}"
echo "${path%.log}"
echo "${path#/var}"
echo "${path##*/}"


#----case---

no=2
case "$no" in
	1) echo "1";;
	2) echo "2";;
esac



#----Function---




log_Info() {
        local time
        time=$(date +"%H:%M:%S")
        echo "[INFO] $time - $1"
}

log_Error() {
        local time
        time=$(date +"%H:%M:%S")
        echo "[ERROR] $time -$1"
}

check_host() {
        local target="$1"
        log_Info "Pinging $target..."
        if ping -c 1 "$target" &> /dev/null; then
                log_Info "Host $target is live."
                return 0
        else
                log_Error "Host $target is OFFLINE."
                return 1
        fi
}

log_Info "Starting Dailt net check"

check_host "1.1.1.1"
check_host "192.168.1.99"

log_Info "Script execution complete"

