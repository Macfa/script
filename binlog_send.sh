#!/usr/bin/bash

# define variable
BINLOG_PATH="/usr/local/mysql/data/" #define binary log path
CURRENT_DATE=`date '+%Y%m%d'`; # current date

# proccess on databases
FULL_PATH="/backup/DB_BACKUP/${CURRENT_DATE}" # define full backup log path
BINLOGS=`find $BINLOG_PATH -name "bin.0*" -type f -mtime -1 | xargs -i zip ${FULL_PATH}/${CURRENT_DATE}_binlog.zip {} ` #  get a list of binary log files before 1 days ago

echo -e "\n" | mail -s "$(echo -e 'BINARY BACKUP INFO\nContent-type: multipart/mixed;')" -a "${FULL_PATH}/${CURRENT_DATE}_binlog.zip" ???@naver.com
