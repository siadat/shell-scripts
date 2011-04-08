#!/bin/sh
LIST_FILE=`mktemp`
FOLDER=$1
FILE=$2
'find' $FOLDER -type f -cnewer $FILE -printf "%T@ %p\n" \
  |sort  \
  |grep -o " .*"  \
  | while read file
do
    echo "$file" >> $LIST_FILE
done

feh -ZF --hide-pointer -f $LIST_FILE
