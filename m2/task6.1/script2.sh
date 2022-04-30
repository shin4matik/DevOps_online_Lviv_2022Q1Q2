#!/usr/bin/env bash

echo -e "\033[31m Using Apache log example create a script to answer the following questions: \033[33m"

echo -e "\033[32m 1. From which ip were the most requests? \033[33m"
echo -e "\033[32m 3. How many requests were there from each ip? \033[33m"

awk '{ print $1}' apache_logs.txt | sort | uniq -c | sort -nr | head -n 5

echo -e "\033[32m 2. What is the most requested page? \033[33m"

awk '{print $7}' apache_logs.txt | sort | uniq -c | sort -gr | head -n 5

echo -e "\033[32m 4. What non-existent pages were clients referred to? \033[33m"
 
grep "404 " apache_logs.txt | awk '{ print $15}' | uniq -c

echo -e "\033[32m 5. What time did site get the most requests? \033[33m"

awk '{print $4}' apache_logs.txt | uniq -c | sort -gr | head -n 1

echo -e "\033[32m 6. What search bots have accessed the site? (UA + IP) \033[33m"

awk '/bot/ {print $1, $12, $14, $15, $16}' apache_logs.txt | sort | uniq | awk '{print $1, $2, $3, $5}' | sort | uniq | head -n 10
