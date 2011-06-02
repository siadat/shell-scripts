#!/bin/bash
# usage: la-conjugaison.sh avoir
# Thu 02 Jun 2011 14:07:00 IRDT (+0430)
verbe=$*
if [ -z "$verbe" ]; then
  exit
fi

bldred='\\033[1;31m' # Red
bldgrn='\\033[1;32m' # Green
bldylw='\\033[1;33m' # Yellow
bldwht='\\033[1;37m' # White
txtrst='\\033[0m'    # Text Reset

verbe=`echo "$verbe" |sed -e "s/ /+/g"`
html=`curl -s "http://www.la-conjugaison.fr/du/verbe/$verbe.php"`
results=`echo "$html" \
  |grep -Po '\b(j|je|tu|il|elle|nous|vous|ils)\b(.*?)(?=<[\s/]*br)' \
  |sed -e 's/\bje\b/je  /g' \
  |sed -e 's/\btu\b/tu  /g' \
  |sed -e 's/\bil\b/il  /g' \
  |sed -e 's/\bils\b/ils /g' \
  |sed -e "s/\([^ ]\+ *\)\(.*\)/${bldwht}\1\2/g" \
  |sed -e "s/<b>/${bldylw}/g" \
  |sed -e "s/<\/b>/${txtrst}/g" \
  |head -n 6`


if [ ! -z "$results" ]; then
  echo -e "$results"
fi
