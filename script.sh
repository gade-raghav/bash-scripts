#! /bin/sh

#Script to create a backup of your working dir using tar an pushing it to your server

#create tar archive
tar -zcvf "$(date -I).tar.gz" ~/demofile.txt

#validating command execution status using exit code
if [ $? -eq 0 ]
then

	#scp command to push files to the server
	scp -i "~/.ssh/id_rsa" /tmp/playground/nibs/"$(date -I).tar.gz" opc@158.101.112.112:~/backup

	if [ $? -eq 0 ]
	then
		#logs
		echo "$(date)               backup created -> upload successful\n" >> logs/backup.logs
		#pushing logs
		scp -i "~/.ssh/id_rsa" /tmp/playground/logs/backup.logs opc@158.101.112.112:~/logs
	else
		#logs
		echo "$(date) exit-code:$?  backup created -> upload not-successful: error while executing scp command\n" >> logs/backup.logs
	fi

else
	#logs
	echo "$(date) exit-code:$?   backup not created\n" >> logs/backup.logs
	#pushing logs
	scp -i "~/.ssh/id_rsa" /tmp/playground/logs/backup.logs opc@158.101.112.112:~/logs
fi	



	


