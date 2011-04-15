#! /bin/sh
find -iname "*${*}*" -type f \
  |grep --color=auto "${*}"
