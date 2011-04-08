#! /bin/sh
echo -ne   "Taking a screenshot in 2s " && sleep 1
echo -ne "\rTaking a screenshot in 1s " && sleep 1
echo -ne "\rTaking a screenshot now..."
FILE=~/Pictures/`date +"%Y-%m-%d--%H-%M-%S"`.png
import -window root $FILE
echo -e "\rSaved at: ${FILE}"
