#! /bin/bash
# Usage: feh-latest.sh [dir]
BASE_DIR=$(dirname "$0")
. $BASE_DIR/feh-lib.sh
LIST_FILE=`mktemp`
DIR=$*
if [ ! -z "${DIR}" ]; then
  cd $DIR
fi

'ls' -1tp `pwd`     \
  | grep -v ".*/"    \
  | grep -i -v ".*\(${NOT_PHOTO}\)$" \
  | while read file
do
  echo "`pwd`/${file}" >> $LIST_FILE
done

start_feh "$LIST_FILE"
