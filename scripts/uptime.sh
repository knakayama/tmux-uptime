#!/bin/bash

_uptime="$(uptime)"

if echo "$_uptime" | grep -qF 'day'; then
    echo "$_uptime" | tr -s ' ' | perl -wlne 's/\smins//; printf "%s %s min\n",$1,$2 if /up\s(.+?)s?,\s(.+?),/'
else
    echo "$_uptime" | tr -s ' ' | perl -wlne 'printf "$1 min\n"if /up\s(.+?)(:?\smins?)?,/'
fi

