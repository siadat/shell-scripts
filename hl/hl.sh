#!/bin/sh

# print content of FILE with regex matches highlighted.
# requires: perl

# usage: hl REGEX FILE
#        cat FILE | hl

bldwht='\e[1;37m' # White
bakcyn='\e[46m'   # Cyan
txtrst='\e[0m'    # Text Reset

regex=${1}
file=${2}

perl -pe "s/(${regex})/${bakcyn}${bldwht}$+${txtrst}/g" $file
