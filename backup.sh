#!/bin/bash

SOURCE="/etc/nginx"
DEST="/backup/nginx_$(date +%Y-%m-%d)"
mkdir -p $DEST
LOGFILE="/var/log/backup.log"
cp -r $SOURCE $DEST
if [ $? -eq 0 ]; then
echo "File copied successfully!"
echo "$(date): Backup successfully - $DEST" >> $LOGFILE
else
echo "Error!: failed to copy files"
echo "$(date): Backup failed - $DEST" >> $LOGFILE
fi



