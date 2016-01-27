#!/bin/bash

cd "`dirname $0`"

cd ../web

rm -r downloads
mkdir downloads
cd downloads

version=1.6.7

wget https://downloads.arduino.cc/arduino-${version}-linux64.tar.xz
wget https://downloads.arduino.cc/arduino-${version}-windows.exe
wget https://downloads.arduino.cc/arduino-${version}-windows.zip
wget https://downloads.arduino.cc/arduino-${version}-macosx.zip
wget https://downloads.arduino.cc/arduino-${version}-linux32.tar.xz