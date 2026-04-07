#!/bin/bash

DIR=$1
BUCKET=$2

if [ -z "$DIR" ] || [ -z "$BUCKET" ]; then
    echo "Uso: backup_s3.sh <directorio> <bucket>"
    exit 1
fi

FILE="backup_$(date +%s).tar.gz"

tar -czf $FILE $DIR

aws s3 cp $FILE s3://$BUCKET/

echo "Backup realizado: $FILE" >> logs/backup.log
