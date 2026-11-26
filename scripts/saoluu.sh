#!/bin/bash

ROOT=~/2400349_TuHung_Linux

DATA=$ROOT/data
BACKUP=$ROOT/backup
LOG=$ROOT/logs/backup.log

if [ ! -d "$DATA" ]
then
    echo "Khong ton tai thu muc data!"
    exit 1
fi

TIME=$(date +%Y%m%d_%H%M%S)

FILE=backup_${TIME}.tar.gz

tar -czf $BACKUP/$FILE $DATA > /dev/null 2>&1

if [ $? -eq 0 ]
then
    STATUS="Thanh cong"
    echo "Sao luu thanh cong!"
else
    STATUS="That bai"
    echo "Sao luu that bai!"
fi

echo "$(date) | $FILE | $STATUS" >> $LOG

ech
echo "===== DANH SACH FILE SAO LUU ====="
ls -lh $BACKUP
