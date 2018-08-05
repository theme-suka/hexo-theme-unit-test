#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Install Suka Theme...'
echo '-------------------------------------'
echo ''
mkdir -p ./themes/suka
cp -rf ../hexo-theme-suka/* ./themes/suka/
cd ./themes/suka
npm i --production > /dev/null
cd ..
cd ..