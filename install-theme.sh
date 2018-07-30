#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Install Suka Theme...'
echo '-------------------------------------'
echo ''
git clone https://github.com/SukkaW/hexo-theme-suka.git themes/suka
git clone --quiet https://github.com/SukkaW/hexo-theme-suka.git themes/suka
cd themes/suka
git checkout -t origin/canary
git pull
rm -rf .git
npm i --production > /dev/null
cd ..
cd ..