#!/bin/bash

server=("8.8.8.8" "1.1.1.1" "192.168.1.99" "9.9.9.9" "8.8.4.4")

start=$(date +%s)

echo "---Ping test start----"

for ip in "${server}"; do
        (
                if ping -c 1 -W 2 "$ip" &> /dev/null; then
                        echo "$ip ping is up"
                else
                        echo "$ip ping is down"
                fi
        ) &
done

echo "all ping dispatched"

wait

end=$(date +%s)

duration=$((start - end))

echo " -------scan complete with in $duration--- "
