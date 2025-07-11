#! /bin/bash

# System Health Check
LOGFILE="/var/log/system_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)
uptime=$(uptime -p)
cpu_load=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')
memusage=$(free -h | grep Mem | awk '{print $3 "/" $2}')
diskusage=$(df -h | grep '^/dev/' | awk '{print $1 ": " $5 " used"}')

message=$(echo -e "Date: $DATE | Host: $HOST\nUptime: $uptime\nCPU Load: $cpu_load\nMemory Usage: $memusage\nDisk Usage: $diskusage")
json_message=$(echo -e "date\": \"$DATE\", \"host\": \"$HOST\", \"uptime\": \"$uptime\", \"cpu_load\": \"$cpu_load\", \"memory_usage\": \"$memusage\", \"disk_usage\": \"$diskusage")

echo "======= System Health Check for $HOSTNAME - $DATE ======" | tee -a $LOGFILE

# Check uptime
echo -e "\n--- Uptime ---" | tee -a $LOGFILE
uptime | tee -a $LOGFILE

# CPU Load
echo -e "\n--- CPU Load ---" | tee -a $LOGFILE
top -bn1 | grep "load average" | tee -a $LOGFILE

# Memory usage
echo -e "\n--- Memory Usage ---"
free -h | tee -a $LOGFILE

# Disk Usage
echo -e "\n--- Disk Usage ---"
df -h | tee -a $LOGFILE

echo -e "\n===== End of Report =====" | tee -a $LOGFILE
