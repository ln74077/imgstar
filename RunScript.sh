#!/bin/sh
file="/home/ln/MainURL.txt"
cnt=0
export status="TRUE"
export TRUE="TRUE"
while IFS= read line
do
cnt=$((cnt+1))
        # display $line or do somthing with $line
echo $status==$TRUE
	if [ "$status" = "$TRUE" ]; then
	status="FALSE"
	wget --wait=20 --random-wait $line
	fi 

	if [ $? -eq 0 ]; then
	status="TRUE"
#	sed -e "${lc}d" $file
	if [ $cnt -eq 40 ];
		then
		echo "Waiting for time"
		sleep 10
		cnt=0
		
	fi
	fi

done <"$file"
