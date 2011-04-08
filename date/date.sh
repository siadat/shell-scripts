#!/usr/bin/zsh
# Get time and date in the cities I care about
# Usage: date.sh
# Suggestions: watch --color -n 1 date.sh

# NOTE: uses zsh

bldylw='\e[1;33m' # Yellow
bldwht='\e[1;37m' # White
txtrst='\e[0m'    # Text Reset

getdate() { 
  date +"%:z ${bldwht}%T${txtrst} %F ${bldylw}%Z${txtrst}" 
}

# http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
export TZ=Asia/Tehran
IRST=`getdate`
export TZ=Europe/London
GMT=`getdate`
#export TZ=America/Montreal
export TZ=America/New_York
EST=`getdate`
export TZ=America/Chicago
CST=`getdate`
export TZ=America/Los_Angeles
PST=`getdate`

echo "     Tehran ${IRST}"
echo "     London ${GMT}"
echo "   New York ${EST} (Eastern) = Quebec"
echo "    Chicago ${CST} (Central)"
echo "Los Angeles ${PST} (Pacific)"

# not needed:
unset TZ
