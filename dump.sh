mysqldump -u root -p $MYSQL_PASSWORD --databases sorveteria > dump-$(date '+%Y-%m-%d').sql
