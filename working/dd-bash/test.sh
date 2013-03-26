#!/bin/bash
FOO="$(cat)"

if [ "$FOO" ]; then
   echo "contents:"
   echo "$FOO" | sed 's/^/  /g'
else
   echo "no contents."
fi

if [ "$(echo "$FOO" | grep SOLVE | wc -l)" -ge 3 ]; then 
   echo PASS
   exit 0
else
   echo FAIL
   exit 1
fi
