#!/bin/bash

uptime | tr -s ' ' | perl -wlne 'print $1 if /(up.+?),/'

