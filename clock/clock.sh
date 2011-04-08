#!/bin/bash
# Fri 25 Feb 2011 15:06:43 IRST (+0330)
# -b flag depends on beep.sh for beeping

# This is bloody awesome: 
#  while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
# (from commandlinefu.com by flatcap?)

## Get options:
IS_SILENT="true"
while getopts 'u:t:d:hs' OPTIONNN
do
    case $OPTIONNN in
        'd') IS_COUNT_DOWN="true"; OPT_COUNTDOWN="$OPTARG" ;;
        't') IS_COUNT_UP="true"; OPT_COUNTUP="$OPTARG" ;;
        'u') IS_COUNT_UP="true"; OPT_COUNTUP="$OPTARG" ;;
        'b') IS_SILENT="false"; echo "With beep." ;;
        'h') 
             echo "Usage:"
             echo "  clock.sh 2             Count down from minute 2"
             echo "  clock.sh               Count up"
             echo "Also:"
             echo "  clock.sh -d 2          Count down from minute 2"
             echo "  clock.sh -u 2          Count up to minute 2"
             echo "  clock.sh -u            Count up"
             echo "" 
             echo "  Note: -t is an alias for -u"
             exit
             ;;
  esac
done

if [ ! "$IS_COUNT_DOWN" ]; then
    if [ ! "$IS_COUNT_UP" ]; then
        ## If no option at all, then count up
        if [ -z "$*" ]; then
            IS_COUNT_UP="true"
        else
            # if a value is given as the only option (e.g. "click.sh 3")
            IS_COUNT_DOWN="true"
            OPT_COUNTDOWN="$*"
        fi
    fi
fi

if [ "$IS_COUNT_DOWN" ]; then
    ## if count down value not given, then nothing
    if [ -z "$OPT_COUNTDOWN" ]; then
        echo $OPT_COUNTDOWN
        echo "Count down from what? Need a value for -d option"
    else
        MIN=$OPT_COUNTDOWN;
        for ((i=$((MIN*60));i>=0;i--)); do 
            echo -ne "\rCount down from $MIN min: $(date -d"0+$i sec" +%H:%M:%S) "; sleep 1;
        done
        if [ ! "$IS_SILENT" ]; then
            beep.sh
        fi
    fi
elif [ "$IS_COUNT_UP" ]; then
    ## if count up value not given, then start without stop
    if [ -z "$OPT_COUNTUP" ]; then
        for ((i=$((0));;i++)); do 
            echo -ne "\rCount up: $(date -d"0+$i sec" +%H:%M:%S) "; sleep 1;
        done
    else
        MAX=$OPT_COUNTUP;
        for ((i=$((0));i<=$((MAX*60));i++)); do 
            echo -ne "\rCount up to $MAX min: $(date -d"0+$i sec" +%H:%M:%S) "; sleep 1;
        done
        if [ ! "$IS_SILENT" ]; then
            beep.sh
        fi
    fi
fi
