#!/bin/bash

cd "`dirname \"$0\"`"
cd ../web/site

pages_done=""

changed=true
while [ $changed == true ]
do
  echo '-------------------------'
  changed=false
  for file in `find`
  do
    if [ -d "$file" ]
    then
      continue
    fi
    file=`echo "$file" | sed -e 's/[.][/]//g'`
    file_echoed=false
    ../../bin/replace_starthardware_in_file.py "$file"
  done
done




