#!/bin/bash

cd "`dirname \"$0\"`"
cd ../web/site


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
    for page in `../../bin/replace_starthardware_in_file.py "$file"`
    do
      if [ $file_echoed == false ]
      then
        echo "$file"
        file_echoed=true
      fi
      echo "- $page"
      wget -N -c -p -q "$page"
      changed=true 
    done
  done
done




