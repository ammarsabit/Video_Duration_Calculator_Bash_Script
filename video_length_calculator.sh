#!/bin/bash

if [[ $1 == "" ]]; then
	echo "Enter Folder path absolute/relative containing the video(.mp4) files"
	read path
	echo "What is the the file extension of the videos(mp4/mkv/mov/avi)"
	read extension

elif [[ $1 != "" && $2 != "" ]]; then
	path=$1
	extension=$2

else
	echo "Pass the file path and the video extension as an argument: ./video_duration_calculator.sh [path] [extension]"
	echo "or dont pass the path and the video extension as an argument instead run the script and fill the input"
fi

format_time(){
	time=$1
	hours=0
	minutes=0
	seconds=0

	while (( $(echo "$time >=3600" | bc) ));
	do
	  time=$(echo "$time-3600" | bc)
	  (( hours ++ ))
	done

	while (( $(echo "$time >=60" | bc) ));
        do
          time=$(echo "$time-60" | bc)
          (( minutes ++ ))
        done
	#seconds=$time
	seconds=$(echo "scale=0; $time/1" | bc)
	echo "$hours hours , $minutes minutes, $seconds seconds"
}

echo "calculating the total video length"
total_time=0.00
for video in "$path"/*."$extension"; 
do 
  duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$video")
  total_time=$(echo "scale=2; $total_time + $duration" | bc)
  echo "$video =  $duration second"
  
done

format_time $total_time

