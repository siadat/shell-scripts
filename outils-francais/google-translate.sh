#!/bin/bash
# usage: translate.sh parler
# can fail in places marked with XXX
# Thu 02 Jun 2011 14:07:14 IRDT (+0430)

bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldwht='\e[1;37m' # White
txtrst='\e[0m'    # Text Reset

phrase=$*
query=`echo $phrase |sed -e 's/ /+/g'`
url="http://www.google.com/m/search?sourceid=chrome&ie=UTF-8&q=translate:$query"
# NOTE: extra spaces are removed by sh when joining the words using doublequotes
html=`curl "$url" --silent`

# XXX: grep, head
did_you_mean=`echo "$html" \
  |grep -o -P ">[\s]*translate:[^<>]+" \
  |sed -e 's/[^:]*://g' \
  |head -n 1`

# XXX: head
phrase_dash_translate=`echo "$html" \
  |grep -o -P "$phrase [^<>]+" \
  |grep -v "Google" \
  |head -n 1`

if [ ! -z "$phrase_dash_translate" ]; then
  phrase_remote=`echo "$phrase_dash_translate" |sed -e 's/-.*//g'`
  translation_remote=`echo "$phrase_dash_translate" |sed -e 's/.*-//g'`
  echo -e "$phrase_remote-${bldylw}$translation_remote${txtrst}"
fi

if [ ! -z "$did_you_mean" ]; then
  echo -e "Did you mean: ${bldgrn}$did_you_mean${txtrst}"
fi
