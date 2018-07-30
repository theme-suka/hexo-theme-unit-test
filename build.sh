#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Test _config.example.yml...'
echo '-------------------------------------'
echo ''
\cp -f themes/sukka/_config.example.yml themes/sukka/_config.yml
hexo clean --silent
hexo g
echo ''
echo '-------------------------------------'
echo 'Build demo site...'
echo '-------------------------------------'
echo ''
\cp -f ./theme_config.yml themes/sukka/_config.yml
hexo clean --silent
hexo g && gulp