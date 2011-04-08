#!/bin/bash
# Sina Siadat
# List file extensions order by the number of their occurances

find -maxdepth 1 -type f   \
  |sed -e "s/^\.\///g"     \
  |grep -o -e "\.[^.]*$"   \
  |sort                    \
  |uniq -c                 \
  |sort -gr

# sed --> remove "./" from the beginning.
# grep --> get the extension (last occurance of dot-blah)
