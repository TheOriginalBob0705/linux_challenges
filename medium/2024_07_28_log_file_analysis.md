# Log File Analysis

## *Difficulty*: Medium

## Objective

Write a script that processes a web server log file and extracts specific information.
The log file follows the Common Log Format (CLF) and contains entiries such as:

```
127.0.0.1 - frank [10/Oct/2000:13:54:17-0700] "GET /apache_pb.gif HTTP/1.0" 200 2364784
```

Your task is to write a script that:

1. Counts the total number of requests
2. Identifies the top 3 most requested URLs
3. Counts the number of requests per status code (e.g. 200, 404, etc.)
4. Finds the IP address with the highest number of requests

## Requirements

- The script should be written in Bash, Python, or any other language commonly used for scripting in Linux
- The script should accept the log file as an input argument

## Example log file

The log file will be saved under a file named 2024_07_28_access.log

## Expected Output

For the given example log file, the output should look something like this:

```
Total number of requests: 14
Top 3 most requested URLs:
1. /login (4 requests)
2. /apache_pb.gif (3 requests)
3. /products (2 requests)
Requests per status code:
200: 9
401: 4
404: 1
IP address with the highest number of requests:
192.168.1.1 (5 requests)
```

## Hints

- Use tools like *awk, sed, cut*, and *sort* for text processing in Bash
- In Python, consider using regular expressions (the re module) to parse log entries
- Use dictionaries (or similar data structures) to count occurrences of URLs, status codes, and IP addresses

---

# Extra Challanges

## 1: Request distribution by hour

*Objective*: Analyze the distribution of requests by hour of day

*Details*: Modify your script to count the number of requests made each hour and display the result

### Expected Output


```
Requests per hour:
13: 9
14: 4
17: 1
```

## 2: Identify unique visitors

*Objective*: Count the number of unique IP addresses (visitors) in the log file

### Expected Output
```
Total number of unique visitors: 4
```

## 3: Filter requests by status code

*Objective*: Modify your script to accept an optional command-line argument that specifies a status code.
When provided, the script should only count and analyze requests with that status code

### Example Usage:


```
./log_analysis.sh 2024_07_28_access.log 200
```

### Expected Output:

```
Total number of requests with status code 200: 9
Top 3 most requested URLs:
1. /apache_pb.gif (3 requests)
2. /products (2 requests)
3. /about (1 request)
Requests per hour:
13: 5
14: 3
17: 1
IP address with the highest number of requests:
127.0.0.1 (4 requests)
```

## 4: Average response size

*Objective*: Calculate the average size (in bytes) of responses for each status code

### Expected Output

```
Average response size per status code:
200: 789216 bytes
401: 532 bytes
404: 1234 bytes
```

## 5: Identify potential security issues

*Objective*: Identify and report potential security issues such as multiple failed login attempts
(status code 401) from the same IP address within a short period (e.g. within 5 minutes)

### Expected Output:

```
Potential security issues:
IP: 192.168.1.1 had 4 failed login attempts within 5 minutes
```

## 6: Generate a summary report

*Objective*: Generate a summary report in a formatted text file

*Details*: The summary should include all previously computed statistics, and it should be saved to
a file named summary_report.txt

