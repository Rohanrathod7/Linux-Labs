#!/bin/bash

LOG_FILE="/home/rohan_rathod/linux-labs/labs/07_health_monitor/utils/system_health.log"
CURR_TIME=$(date +"%Y-%m-%d %H:%M:%S")

AVAIL_RAM=$(free -m | awk '/^Mem:/ {print $7}')


echo "[$CURR_TIME] Available RAM:${AVAIL_RAM}MB" >> "$LOG_FILE"


#______________OUTPUT___________

#cat /home/rohan_rathod/linux-labs/labs/07_health_monitor/utils/system_health.log
#[2026-08-15 12:35:54] Available RAM:7362MB
#[2026-08-15 12:37:01] Available RAM:7358MB
#[2026-08-15 12:38:01] Available RAM:7358MB
#[2026-08-15 12:39:01] Available RAM:7357MB
#[2026-08-15 12:40:01] Available RAM:7362MB
#[2026-08-15 12:41:02] Available RAM:7367MB
#[2026-08-15 12:42:01] Available RAM:7366MB
