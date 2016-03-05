#!/bin/bash

cd "`dirname $0`"

cd ../web

mkdir -p downloads
cd downloads

wget -c -N -O ledtable.zip https://github.com/niccokunzmann/ledtable/archive/master.zip
wget -c -N -O Adafruit_NeoPixel.zip https://github.com/adafruit/Adafruit_NeoPixel/archive/master.zip
