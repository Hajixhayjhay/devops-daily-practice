#!/bin/bash

SOURCE="/etc/nginx"
DEST="/backup/nginx_$(date +%Y-%m-%d)"
sudo mkdir -p $DEST
LOGFILE="/var/log/backup.log"
sudo touch $LOGFILE
sudo chmod 644 $LOGFILE
cp -r $SOURCE $DEST
if [ $? -eq 0 ]; then
echo "File copied successfully!"
echo "$(date): Backup successfully - $DEST" >> $LOGFILE
else
echo "Error!: failed to copy files"
echo "$(date): Backup failed - $DEST" >> $LOGFILE
fi



