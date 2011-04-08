#!/bin/bash
echo "Find regexp: \<${1}\>"
echo "Replace with: ${2}"
echo "In these files:"
find -type f |xargs grep --color=auto "\<${1}\>"
find -type f |xargs grep -l "\<${1}\>" |xargs sed -i -e "s/\<${1}\>/${2}/g"
