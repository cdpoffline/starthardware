#!/bin/bash

cd "`dirname $0`"

./download_installers.sh

cd ../web

rm -r starthardware.org

wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --span-hosts \
     --domains='*.gravatar.com,ajax.googleapis.com,fonts.googleapis.com,starthardware.org,www.googletagmanager.com' \
     --exclude-domains=www.youtube.com,sciencehackday2015.eventbrite.com \
     http://starthardware.org
