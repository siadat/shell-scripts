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
IRA=`getdate`
export TZ=Europe/London
LON=`getdate`
export TZ=America/New_York
NYC=`getdate`
export TZ=America/Chicago
CHI=`getdate`
export TZ=America/Los_Angeles
LOS=`getdate`
export TZ=Asia/Singapore
SIN=`getdate`
export TZ=Australia/Sydney
SYD=`getdate`

echo "     Sydney ${SYD}"
echo "  Singapore ${SIN}"
echo "     Tehran ${IRA}"
echo "     London ${LON}"
echo "   New York ${NYC} (Eastern) = Quebec"
echo "    Chicago ${CHI} (Central)"
echo "Los Angeles ${LOS} (Pacific)"

# not needed:
unset TZ
