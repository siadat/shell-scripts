#! /bin/sh
# Usage example: convert.sh 10000USD
FROM=$1

convert() {
  # Note: the following JSON extrator assumes that the results are wrapped in 
  # double-quotes, e.g. {lhs: "blah"}. And that the second "blah" is rhs.
  # Comment the |nl line if converted value is not the second line.

  if [ x"`echo $1 |grep -o $2`" = x ]; then

    RESULT=`curl -s "http://www.google.com/ig/calculator?hl=en&q=$1=?$2" \
      | tr -c -d '[:print:]'`

    echo ${RESULT} \
      | grep -o -e '"[^"]\+"' \
      | sed -e 's/"\([^"]\+\)"/\1/g' \
      | nl |grep -e "^\s*2" |sed -e "s/^\s*2//g" \
      | grep --color=auto "[0-9]\+"

  fi
}

convert $FROM "GBP"
convert $FROM "USD"
convert $FROM "CAD"
convert $FROM "AUD"
convert $FROM "EUR"
