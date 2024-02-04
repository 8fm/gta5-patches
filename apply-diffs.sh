#!/bin/bash

DIFF_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ $# -eq 1 ] ; then
  DIFF_DIR=$DIFF_DIR/$1
fi

echo "DIFF_DIR=$DIFF_DIR"
find $DIFF_DIR -name *.diff | while read f
do
  echo "git apply $f"
  git apply --whitespace=nowarn --ignore-space-change --ignore-whitespace "$f"
done
echo "DONE"
