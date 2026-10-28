#!/usr/bin/env bash

echo "Hello from server-stats"


get_cpu_usage() {

	cpu_usage=$(awk '{
		# Snapshot 1
		if (NR == 1) {
			prev_idle = $4 + $5;
			prev_total = 0;
			for (i=1; i<=8; i++) prev_total += $i;
		}

		#Snapshot 2 
		else {
			curr_idle = $4 + $5;
			curr_total = 0;
			for (i=1; i<=8; i++) curr_total += $i;


			total_delta = curr_total - prev_total;
			idle_delta = curr_idle  - prev_idle;


			usage = (1 - (idle_delta / total_delta)) * 100;
			printf "CPU Usage: %.2f%%\n", usage;
		}
	}'  <(head -n 1 /proc/stat) <(sleep 1; head -n 1 /proc/stat))

	echo "$cpu_usage"
	echo ""
}

get_memory_usage() {
	echo "==== Memory Usage ===="
	mem_usage=$(free -m | awk '/^Mem:/ {printf "Used: %dMB / Total: %dMB (%.2f%%)", $3, $2, ($3/$2)*100}')
	echo "$mem_usage"
	echo ""
}



get_disk_usage() {
	echo "=====  Disk Usage  ====="
	df -B1 --total -x tmpfs -x devtmpfs -x squashfs -x overlay | tail -n 1 | awk '{printf "Used: %.2fGB / Total: %.2fGB (%.2f%%)\n", $3/1024/1024/1024, $2/1024/1024/1024, ($3/$2)*100}'
	echo ""
}


get_top_cpu_processes() {
	echo "===== Top 5 Processes by CPU ====="
	ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6
	echo ""
}

get_top_mem_processes() {
	echo "=====  Top 5 Processes by Memory ====="
	ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6
	echo ""
}


get_cpu_usage
get_memory_usage
get_disk_usage
get_top_cpu_processes
get_top_mem_processes
