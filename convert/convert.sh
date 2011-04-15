#! /bin/sh
# Usage example: convert.sh 10000USD

convert() {

  # Following JSON extrator assumes that the results are wrapped in
  # double-quotes, e.g. {lhs: "blah"}

  if [ x"`echo $1 |grep -o $2`" = x ]; then

    RESULT=`curl -s "http://www.google.com/ig/calculator?hl=en&q=$1=?$2" \
      | tr --complement --delete '[:print:]' \
      | tr --delete '\n\r'`
    
    # google returns special space character to group every 3 digits, but grep
    # mistakes it with a newline. So we remove everything that is NOT printable.

    echo ${RESULT} \
      | sed -e 's/\("[^"]\+"\)/\1\n/g' \
      | grep -e 'rhs' \
      | sed -e 's/.*"\([^"]\+\)".*/\1/g' \
      | grep --color=auto "[0-9]\+"

  fi
}

FROM=$1
convert $FROM "GBP"
convert $FROM "USD"
convert $FROM "CAD"
convert $FROM "AUD"
convert $FROM "EUR"
