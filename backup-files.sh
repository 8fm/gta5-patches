#!/bin/bash

BACKUP_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BACKUP_DIR=$BACKUP_DIR/backup
echo "BACKUP_DIR=$BACKUP_DIR"
find . -name $1 | while read f
do
  CUR_DIR="$(dirname $BACKUP_DIR/$f.diff)"
  mkdir -p "$CUR_DIR"
  cp "$f" $CUR_DIR
done
echo "DONE"
