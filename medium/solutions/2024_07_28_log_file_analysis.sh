#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile=$1

# Check if the file exists
if [ ! -f "$logfile" ]; then
    echo "File not found"
    exit 1
fi

# 1: Count the total number of requests
total_requests=$(grep -cve '^\s*$' "$logfile")
echo "Total number of requests:
$total_requests"

# 2: Identify the top 3 most requested URLs
echo "Top 3 most requested URLs:"
awk 'NF' "$logfile" | awk '{print $6}' | sort | uniq -c | sort -nr | head -3 | awk '{print NR ". " $2 " (" $1 " requests)"}'

# 3: Count the number of requests per status code
echo "Requests per status code:"
awk 'NF' "$logfile" | awk '{print $8}' | sort | uniq -c | sort -nr | while read count code; do
    echo "$code: $count"
done

# 4: Find the IP address with the highest number of requests
top_ip=$(awk 'NF' "$logfile" | awk '{print $1}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2 " (" $1 " requests)"}')
echo "IP address with the highest number of requests:
$top_ip"

