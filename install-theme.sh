#!/bin/sh
echo -n '
-------------------------------------
Install Suka Theme...
-------------------------------------
'
mkdir -p ./themes/suka
cp -rf ../hexo-theme-suka/* ./themes/suka/
cd ./themes/suka
npm install --production > /dev/null
cd ..
cd ..
