#!/bin/bash

cd "`dirname $0`"

cd ../web

mkdir -p downloads
cd downloads

version=1.6.7

wget -c -N https://downloads.arduino.cc/arduino-${version}-linux64.tar.xz
wget -c -N https://downloads.arduino.cc/arduino-${version}-windows.exe
wget -c -N https://downloads.arduino.cc/arduino-${version}-windows.zip
wget -c -N https://downloads.arduino.cc/arduino-${version}-macosx.zip
wget -c -N https://downloads.arduino.cc/arduino-${version}-linux32.tar.xz