#! /bin/sh

echo "Starting..."
cd /data
printf "Run  python /root/JableTVDownload/main.py %s\n" $URL
python /root/JableTVDownload/main.py --url $URL
