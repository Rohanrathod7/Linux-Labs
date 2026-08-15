#!/bin/bash

LOG_FILE="/home/rohan_rathod/linux-labs/labs/07_health_monitor/utils/system_health.log"
CURR_TIME=$(date +"%Y-%m-%d %H:%M:%S")

AVAIL_RAM=$(free -m | awk '/^Mem:/ {Print $7}')

echo "[$CURR_TIME] Available RAM:${AVAIL_RAM}MB" >> "$LOG_FILE"
