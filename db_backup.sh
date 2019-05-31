#!/bin/bash

# tag : db backup
dump_date=$(date +%Y%m%d);
CURRENT_DATE=`date '+%Y-%m-%d %H:%M:%S'`;

# ... ....
dump_dir="/backup/DB_BACKUP";

DB_optimize_switch=0;

#/usr/local/mysql4.1/bin/mysqlshow

for database in `/usr/local/mysql/bin/mysqlshow --login-path=root | awk -F" " '{ print $2 }' | grep -v "^$" |grep -v "Databases"`
do
    echo "*------------------------------------------------------ *";
    echo "* ${database} START";
    echo "*------------------------------------------------------ *";

    if [ ! -d "${dump_dir}/${dump_date}/${database}" ]
    then
         mkdir -p ${dump_dir}/${dump_date}/${database};
    fi

    for table in `/usr/local/mysql/bin/mysql --login-path=root -e"show tables" ${database} | grep -v "Tables_in_${database}" | grep -v "^$"`
    do
       if [ ${DB_optimize_switch} = "1" ]
       then
           mysql --login-path=root -e"optimize table ${table}" ${database}
       fi

       /usr/local/mysql/bin/mysqldump --login-path=root --quick --single-transaction "${database}" ${table} > ${dump_dir}/${dump_date}/${database}/${table}.sql

       # parse multi logbin file to sql file before current time from each databases by chy
       # /usr/local/mysql/bin/mysqlbinlog /usr/local/mysql/data/localhost-bin.0* --database="${database}" --stop-datetime="${CURRENT_DATE}" -vv > ${dump_dir}/${dump_date}/${database}/${database}_increase.sql
       echo "mysql --login-path=root ${database} < $table.sql" >> $dump_dir/$dump_date/$database/restore.sh
       echo $table;
    done

    sleep 1;
done

# increase file All Database
# /usr/local/mysql/bin/mysqlbinlog /usr/local/mysql/data/localhost-bin.0* --stop-datetime="${CURRENT_DATE}" > ${dump_dir}/${dump_date}/all_db_increase.sql

echo "* ----------------------- - 3 DAY DELETE-------------------- *";

# use purge function instead rm command
# find /usr/local/mysql/data -name "localhost-bin.0*" -type f -mtime +1 | xargs -i cp {} ${dump_dir}/${dump_date}/
/usr/local/mysql/bin/mysql --login-path=root -e "PURGE MASTER LOGS BEFORE DATE_SUB(CURRENT_DATE, INTERVAL 3 DAY)"
Old_Date=`/bin/date -d "3 day ago" +"%Y%m%d"`;
rm -rf ${dump_dir}/${Old_Date};


echo "*----------------------------------------------------------- *";
echo "* BACKUP PATH : ${dump_dir}/${dump_date} ";
echo "*----------------------------------------------------------- *";
ls -latr ${dump_dir}/${dump_date};
exit 0;
