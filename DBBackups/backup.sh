 docker exec nodechat /usr/bin/mysqldump -u root --password=smoot nodechat > $HOME/Rebo_Server/DBBackups/sql_backups/$(date +%Y-%m-%d).sql
