 docker exec nodechat /usr/bin/mysqldump -u root --password=smoot nodechat > $HOME/Rebo_Server/DBBackups/$(date +%Y-%m-%d_%H:%M).sql
