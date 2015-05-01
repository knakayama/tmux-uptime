#!/bin/bash

_uptime="$(uptime)"

if echo "$_uptime" | grep -qF 'day'; then
  echo "$_uptime" | tr -s ' ' | perl -wlne 's/\smins?//; printf "%sd %sh\n",$1,$2 if /up\s(\d+)\sdays?,\s(.+?),/'
elif echo "$_uptime" | grep -qF 'sec'; then
  echo "$_uptime" | tr -s ' ' | perl -wlne 'printf "%ss\n",$1 if /(\d+\ssecs?)/'
elif echo "$_uptime" | grep -qE ':[0-9]{2},'; then
  echo "$_uptime" | tr -s ' ' | perl -wlne 'printf "%sh\n",$1 if /up\s(.+?)(:?\smins?)?,/'
else
  echo "$_uptime" | tr -s ' ' | perl -wlne 'printf "%sm\n",$1 if /up\s(.+?)(:?\smins?)?,/'
fi

