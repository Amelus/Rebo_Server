#!/bin/bash
echo "Starting DB cleanup"
backupFile=$HOME/Rebo_Server/DBBackups/sql_backups/$(date +%Y-%m-%d).sql

if [[ -s $backupFile ]]; then
	echo "Found backupFile $backupFile"
	echo "Performing truncate"
	docker exec -i nodechat mysql -u root --password=smoot -se "use nodechat;truncate table room;truncate table message"
	echo "Cleanup completed"
else
	echo "Backup file $backupFile does not exist"
	echo "No cleanup will be done"
fi
