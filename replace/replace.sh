#!/bin/bash
# Uses Ack for searching and Perl for replacing.
# Note: in Debian Ack is called `ack-grep` instead.
regex=${1}
replace=${2}
filenames=`ack -lw ${regex}`

if [ -z ${filenames} ]; then
  echo 'No match.'
  exit
fi

ack -w ${regex}
echo -n "s/${regex}/${replace}/g (y/n)> "
read user_enter

if [ "$user_enter" != 'y' ]; then
  exit
fi

ack -lw --print0 ${1} |xargs -0 -n 1 perl -i -pe "s/${regex}/${replace}/g"
echo 'Updated files:'
echo $filenames
