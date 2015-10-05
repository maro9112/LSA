#!/usr/bin/env bash
MAX_MEM=80
usage=$(df | grep /$ | tr -s ' ' | cut -d' ' -f5 | tr -d %)
if [ $usage -gt $MAX_MEM ]
then
echo "ALERT: memory usage above 80%!" | mail -s "Memory Alert!" root
fi