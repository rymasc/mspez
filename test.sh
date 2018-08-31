#!/bin/sh
#if [ lsb_release -r | awk '{print $2}' = '16.04' ]; then
#   echo '16.04 yeah'
#fi
v="$(lsb_release -r | awk '{print $2}')"
echo "${v}"
if [ "${v}" = 16.04 ]; then
   echo 'hi'
else 
   echo 'no'
fi
