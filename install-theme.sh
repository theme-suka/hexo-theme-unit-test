#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Install Suka Theme...'
echo '-------------------------------------'
echo ''
mkdir ./themes/suka -p
cp -rf ../hexo-theme-suka/* ./themes/suka/
cd ./themes/suka
rm -rf .git
npm i --production > /dev/null
cd ..
cd ..