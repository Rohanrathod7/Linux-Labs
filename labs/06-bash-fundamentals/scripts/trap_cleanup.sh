#!/bin/bash

temp_arc="~/linux-labs/labs/06-bash-fundamentals/scripts/server_backup_$$.tar.gz"

clean_up(){
	echo -e "[TRAP TRIGGERED]"
	rm -r "$temp_arc"
	echo "System is Clean, Exit safely"
}

trap clean_up EXIT SIGINT SIGTERM

echo "creating temp archive $temp_arc"
touch "$temp_arc"

echo "Ctrl-c to exit"
 
sleep 10

echo "Bakcup successfull"


##----------File  tester----------------

