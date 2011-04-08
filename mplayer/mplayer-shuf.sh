#! /bin/bash
BASE_DIR=$(dirname $0)
. $BASE_DIR/mplayer-lib.sh
LIST_FILE=`mktemp`
FOLDER=$*
cd ./$FOLDER
find -type f \
  |grep -i -v ".*\(${NOT_VIDEO}\)" \
  |shuf \
  |while read file 
  do
    echo "`pwd`/${file}" >> $LIST_FILE
  done

start_mplayer $LIST_FILE
