#!/bin/bash
find -iname "*${*}*" -type f\
  |grep --color=auto "${*}"
