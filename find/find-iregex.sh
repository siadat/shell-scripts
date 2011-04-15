#! /bin/sh
find -iregex ".*${*}.*" -type f \
  |grep --color=auto "${*}"
