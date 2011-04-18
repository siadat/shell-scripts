#! /bin/sh
LIST_FILE=`mktemp`
FILE=$*
find -maxdepth 1 -newer "${FILE}" -type f -printf "%T@ %p\n" \
  | sort -n \
  | grep -o " .*"  \
  | while read file
do
    echo "$file" >> $LIST_FILE
done

feh -ZF --hide-pointer -f $LIST_FILE
