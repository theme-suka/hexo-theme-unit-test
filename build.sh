#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Test _config.example.yml...'
echo '-------------------------------------'
echo ''
\cp -f themes/suka/_config.example.yml themes/suka/_config.yml
npm run clean
npm run generate
echo ''
echo '-------------------------------------'
echo 'Build demo site...'
echo '-------------------------------------'
echo ''
\cp -f ./theme_config.yml themes/suka/_config.yml
npm run clean
npm run build
