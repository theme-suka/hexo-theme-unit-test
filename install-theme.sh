#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Install Sukka Theme...'
echo '-------------------------------------'
echo ''
git clone https://github.com/SukkaW/hexo-theme-sukka.git themes/sukka
cd themes/sukka
git checkout -t origin/canary
git pull
rm -rf .git
npm i --production > /dev/null
cd ..
cd ..