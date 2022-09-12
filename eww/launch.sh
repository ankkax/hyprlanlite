#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.sidebar"
EWW=`$HOME/.eww/eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} open-many \
           sidebar \
           hoverb
}

weather() {
	~/.config/eww/scripts/./weather --getdata
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close \
           sidebar \
           hoverb
    rm "$FILE"
fi
