#! /bin/sh
echo "# First one is the largest."
echo
find -iname "*${*}*" -type f -printf "%s %p\n" \
  |sort -nr \
  |sed -e "s/^[^ ]* //g" \
  |grep --color=auto "${*}"
