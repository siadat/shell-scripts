#! /bin/sh
# Usage: feh-shuf.sh [dir]
LIST_FILE=`mktemp`
DIR=$*
if [ ! -z "${DIR}" ]; then
  cd $DIR
fi

'ls' -1tp `pwd`     \
  |grep -v ".*/"    \
  |shuf             \
  |while read file 
do
    echo "`pwd`/${file}" >> $LIST_FILE
done

feh -ZF --hide-pointer -f $LIST_FILE
