#!/bin/bash

if uptime | grep -qF 'day'; then
    uptime | tr -s ' ' | perl -wlne 's/\smins//; printf "%s %s min\n",$1,$2 if /up\s(.+?)s?,\s(.+?),/'
else
    uptime | tr -s ' ' | perl -wlne 'print $1 if /up\s(.+?),/'
fi

