#! /bin/bash
BASE_DIR=$(dirname "$0")
. $BASE_DIR/mplayer-lib.sh
LIST_FILE=`mktemp`
find -type f -printf "%TY-%Tm-%Td--%TH:%TM %p\n" \
  |sort \
  |sed -e "s/^[^ ]* //g" \
  |grep -i -v ".*\(${NOT_VIDEO}\)" \
  |while read file 
  do
    echo "`pwd`/${file}" >> $LIST_FILE
  done
  tac $LIST_FILE

start_mplayer $LIST_FILE
