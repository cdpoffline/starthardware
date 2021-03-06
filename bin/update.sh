#!/bin/bash

cd "`dirname $0`"

./download_installers.sh
./download_libraries.sh

cd ../web

mkdir -p "site"

cd site

echo "downloading website"
wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --span-hosts \
     --domains='*.gravatar.com,ajax.googleapis.com,fonts.googleapis.com,starthardware.org,www.googletagmanager.com,i.ytimg.com' \
     --exclude-domains=www.youtube.com,sciencehackday2015.eventbrite.com \
     -c -N \
     --header='User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0' \
     --header='Cookie: _icl_current_language=de' \
     --header='Referer: http://starthardware.org/' \
     http://starthardware.org


echo "replacing outstanding links"
# ../../bin/replace_starthardware_weblink.sh

echo "remove srcset attribute because it blocks pictures"
for file in `find`
do
  if [ -f "$file" ]
  then
    sed -i 's/srcset="[^"]*"//g' "$file"
  fi
done

exit 0
