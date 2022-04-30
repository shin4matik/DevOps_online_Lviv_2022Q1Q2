#!/usr/bin/env bash

# What & where to backup. 
backup_files=$1
dest=$2

log=$dest/backup.log

# Create archive filename.
day=$(date +%A%T)
hostname=$(hostname -s)
archive_file="$hostname-$day.tar"

# Print start status message.
echo -e "\033[31m Backing up $backup_files to $dest/$archive_file \033[33m"
echo

# Backup the files using tar.
tar -rvf $dest/$archive_file $backup_files
touch $log
echo "$day Backing up $backup_files to $dest/$archive_file $srcdir" > $log
# Print end status message.
echo
echo "Backup finished"
date

