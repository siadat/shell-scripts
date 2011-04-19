#! /bin/sh
BASE_DIR=$(dirname "$0")
. $BASE_DIR/feh-lib.sh
LIST_FILE=`mktemp`
FILE=$*
find -maxdepth 1 -newer "${FILE}" -type f -printf "%T@ %p\n" \
  | sort -n \
  | grep -o " .*"  \
  | grep -i -v ".*\(${NOT_PHOTO}\)$" \
  | while read file
do
    echo "$file" >> $LIST_FILE
done

start_feh $LIST_FILE
