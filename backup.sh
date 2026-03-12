#!/bin/bash
SOURCE="/etc/nginx"
DEST="/backup/nginx_$(date +%Y-%m-%d)"
sudo mkdir -p $DEST
LOGFILE="/var/log/backup.log"
sudo touch $LOGFILE
sudo chmod 644 $LOGFILE
sudo cp -r $SOURCE $DEST
if [ $? -eq 0 ]; then
echo "File copied successfully!"
echo "$(date): Backup successfully - $DEST" | sudo tee -a $LOGFILE
aws s3 cp $DEST s3://nginx-backup-hajarat/ --recursive
if [ $? -eq 0 ]; then
echo "$(date): s3 upload successful" | sudo tee -a $LOGFILE
else
echo "$(date): s3 upload failed" | sudo tee -a $LOGFILE
fi
else
echo "Error!: failed to copy files"
echo "$(date): Backup failed - $DEST" | sudo tee -a $LOGFILE
fi



