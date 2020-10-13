#! /bin/sh

#Script to create a backup of your working dir using tar and pushing it to your server

#create tar archive
tar -zcvf "$(date -I).tar.gz" backup-script.sh

#validating command execution status using exit code
if [ $? -eq 0 ]
then

	#scp command to push files to the server
	scp -i "~/.ssh/id_rsa" "$(date -I).tar.gz" opc@$vmip:~/backup/

	if [ $? -eq 0 ]
	then
		rm -rf $(date -I).tar.gz
		#logs
		echo "$(date +%b) $(date +%d) $(date +%T) noobox               backup created -> upload successful" >> logs/backup.logs
		#pushing logs
		scp -i "~/.ssh/id_rsa" logs/backup.logs opc@$vmip:~/logs
	else
		rm -rf $(date I).tar.gz
		#logs
		echo "$(date +%b) $(date +%d) $(date +%T) noobox exit-code:$?  backup created -> upload not-successful: error while executing scp command" >> logs/backup.logs
		#Sending email about failed status
		sendemail -f $email -t $email -u backup-scrip logs -m "$(date) exit-code:$?  backup created -> upload not-successful: error while executing scp command" -s smtp.googlemail.com:587 -xu gspraghav -xp $pass -o tls=yes 1>> logs/backup.logs
	fi

else
	#logs
	echo "$(date +%b) $(date +%d) $(date +%T) noobox exit-code:$?   backup not created" >> logs/backup.logs
	#Sending email about failed status
        sendemail -f $email -t $email -u backup-scrip logs -m "$(date) exit-code:$?   backup not created" -s smtp.googlemail.com:587 -xu gspraghav -xp $pass -o tls=yes 1>> logs/backup.logs
	#pushing logs
	scp -i "~/.ssh/id_rsa" logs/backup.logs opc@$vmip:~/logs
	rm -rf $(date -I).tar.gz
fi	



	


