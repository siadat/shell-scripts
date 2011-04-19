#! /bin/bash
BASE_DIR=$(dirname "$0")
. $BASE_DIR/mplayer-lib.sh
LIST_FILE=`mktemp`
FOLDER=$*
cd ./$FOLDER
find -type f -maxdepth 1 \
  |grep -i -v ".*\(${NOT_VIDEO}\)" \
  |shuf \
  |while read file 
  do
    echo "`pwd`/${file}" >> $LIST_FILE
  done

tac $LIST_FILE
start_mplayer $LIST_FILE
