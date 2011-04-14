#! /bin/bash
# What: Get time and date in the cities I care about, high light local zone.
# Usage: date.sh
# Suggestions: watch --color -n 1 date.sh
# Requires: bash

bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldwht='\e[1;37m' # White
txtrst='\e[0m'    # Text Reset

LOCAL_TZ=`date +"%Z"`

getdate() { 
  export TZ=$1
  if [ $LOCAL_TZ != `date +"%Z"` ]; then
    echo -e "`date +"${bldwht}%T${txtrst} %a %F %:z %Z"`"
  else                                           
    echo -e "`date +"${bldylw}%T${txtrst} ${bldylw}%a %F ${txtrst}%:z %Z"`"
  fi
}

# See also: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
IRA=`getdate "Asia/Tehran"`
LON=`getdate "Europe/London"`
NYC=`getdate "America/New_York"`
CHI=`getdate "America/Chicago"`
LOS=`getdate "America/Los_Angeles"`
SIN=`getdate "Asia/Singapore"`
SYD=`getdate "Australia/Sydney"`

echo "     Sydney ${SYD}"
echo "  Singapore ${SIN}"
echo "     Tehran ${IRA}"
echo "     London ${LON}"
echo "   New York ${NYC}" # (Eastern and Quebec)"
echo "    Chicago ${CHI}" # (Central)"
echo "Los Angeles ${LOS}" # (Pacific)"
