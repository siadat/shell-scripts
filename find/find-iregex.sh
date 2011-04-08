#!/bin/bash
find -iregex ".*${*}.*" -type f\
  |grep --color=auto "${*}"
