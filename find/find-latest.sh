#! /bin/sh
echo "# First one is the latest."
echo
find -iname "*${*}*" -type f -printf "%TY-%Tm-%Td--%TH:%TM %p\n" \
  |sort -nr \
  |sed -e "s/^[^ ]* //g" \
  |grep --color=auto "${*}"
