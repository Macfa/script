#!/usr/bin/bash

# tag : mail info full
# include files
. /root/cron/mail/disk_space

# define variable
FS_RESULT=`df -h | grep -v "Used" | awk '{print $1,$5,$6}' | check_fs_space` # load function in disk_space file
CURRENT_DATE=`date '+%Y%m%d'`; # current date

# proccess on databases
FULL_PATH="/backup/DB_BACKUP/${CURRENT_DATE}" # define full backup log path

# moves work directory
cd $FULL_PATH # change directory for use zip
if [ ! -e "${CURRENT_DATE}.zip" ]
then
  zip -r ${CURRENT_DATE}.zip ./* # abstract all files and set name
fi

echo -e $FS_RESULT | mail -E -s "$(echo -e 'FILESYSTEM INFO\nContent-type: text/html; charset=utf-8')" ??@naver.com
echo -e "\n" | mail -s "$(echo -e 'FULL BACKUP INFO\nContent-type: multipart/mixed;')" -a "${FULL_PATH}/${CURRENT_DATE}.zip" ??@naver.com
