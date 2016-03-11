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
    for page in `../../bin/replace_starthardware_in_file.py "$file"`
    do
      if [ $file_echoed == false ]
      then
        echo "$file"
        file_echoed=true
      fi
      echo -n "- $page ... "
      if ! echo "$page" | grep -q -x "$pages_done"
      then
        if wget -N -c -p -q \
                --header='User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0' \
                --header='Cookie: _icl_current_language=de' \
                --header="Referer: http://$file" \
                "$page"
        then
          echo "ok"
        else
          echo "fail"
        fi
        changed=true
        pages_done="$pages_done
$page"
      else
        echo "done"
      fi 
    done
  done
done




