#!/bin/bash

PATCH_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PATCH_DIR=$PATCH_DIR"
git diff --name-only $1 | while read f
do
  CUR_DIFF="$PATCH_DIR/$f.diff"
  mkdir -p "$(dirname $CUR_DIFF)"
  git diff -- "$f" | sed $'s/$/\r/' > $CUR_DIFF
done
echo "DONE"
