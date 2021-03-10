#!/bin/bash
backupDir="$HOME/Rebo_Server/DBBackups/backup-$(date +%Y-%m-%d)"
uploadDir="/field_study_3/Conversations_2021/$(date +%Y-%m-%d)"
uploadUrl="https://oc.know-center.tugraz.at/owncloud/index.php/s/Q3W8FqxsCFGRAMG?path=$uploadDir"

echo "Creating backup directory $backupdir"
mkdir $backupDir

echo "Acquiring all room ids"
mapfile result < <(docker exec -i nodechat mysql -u root --password=smoot -se "use nodechat;select id from room;")

echo "Starting backup of messages for acquired room ids"
for row in "${result[@]}";do
	docker exec -i nodechat mysql -u root --password=smoot -se "use nodechat;select timestamp, content from message where roomid = ${row%$'\t'*};" > "$backupDir/conversation-${row}.csv"
done

echo "Backup step completed"

if [ "$(ls -A $backupDir)" ]; then
	echo "Creating directory on Nextcloud"
	curl -u "Q3W8FqxsCFGRAMG:)5aYpg|dH8p7" -X MKCOL "https://oc.know-center.tugraz.at/owncloud/public.php/webdav/$uploadDir" -k
	echo "Finished directory $uploadDir creation"
	echo "Starting upload to Nextcloud $uploadDir"
	export CLOUDSEND_PASSWORD=')5aYpg|dH8p7'
        find $backupDir -iname '*.csv' -exec $HOME/Rebo_Server/DBBackups/cloudsend.sh -p {} $uploadUrl \;
	echo "Upload finished"
else
	echo "$backupDir is Empty, directory will be removed and not uploaded"
	rm -r $backupDir
fi
