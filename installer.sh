#!/bin/bash

mount -oremount,rw /

cd /tzwww/cgi-bin
rm -R imei.sh
wget https://raw.githubusercontent.com/Gl33ch3r/vn007/main/imei.sh
chmod +x imei.sh
cd ..
rm -R changeImei.html
wget https://raw.githubusercontent.com/Gl33ch3r/vn007/main/changeImei.html
rm -R /tmp/installer.sh
