#!/bin/sh
echo ''
echo '-------------------------------------'
echo 'Start Test...'
echo '-------------------------------------'
echo ''
echo "** Check example theme config... **"
echo ''
\cp -f themes/suka/_config.example.yml themes/suka/_config.yml
hexo clean --silent
hexo g
echo "** Check demo theme config... **"
\cp -f ./theme_config.yml themes/suka/_config.yml
hexo clean --silent
hexo g && gulp