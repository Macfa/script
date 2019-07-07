# script
any script for use

# list
* bk
insert a bk file into PATH
use like this: bk {file or dir}*
if you want to it diffenrence open file and modify
  
* db_backup.sh
iterate databases and backup table

* full_send.sh & binlog_send.sh
I want to merge this files to one file ( send.sh )
but, gave up CUZ content-type :P  and separate 2 file, 
  1. binlog_send.sh
  build a zip file for all binlog files before 1 days ago
  and attach this zip files to send a mail
  2. full_send.sh
  this file isn't complete, add to few things .. ex) error in system log
  send a mail with full backup file on each 1 days and send filesystem disk capacity
  
* chksize
need a 1 parameter ( depth )
get current file & dir list
if it is file print size, or it is dir, move into. and recursion
