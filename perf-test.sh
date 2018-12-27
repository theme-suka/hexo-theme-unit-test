#!/bin/sh
# Import 300 Posts
echo -n '
-------------------------------------
* Import 300 posts ... '

cd source/_posts/
git clone https://github.com/SukkaLab/hexo-5000-posts.git --depth=1 --quiet
cd ../..

echo -n 'Done!'

# Run Clean up
echo -n '
* Run clean up ... '

rm -rf themes/suka/source/css/highlight
rm -rf themes/suka/source/lib/prettify/themes
rm -rf themes/suka/source/lib/prism
rm -rf source/assets

echo -n 'Done!
'

# Disable fragment cache
echo '* Test performance ... '

echo '-------------------------------------'
echo '               Round A'
echo ' - fragment_fache: off'
echo ' - hexo built in highlight.js: on'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: on'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i "s|fragment_cache: true|fragment_cache: false|g" themes/suka/_config.yml
npm run generate > perf.log
cat perf.log | grep 'generated in'

# Enable fragment cache
echo ''
echo '-------------------------------------'
echo '               Round B'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: on'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: on'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i "s|fragment_cache: false|fragment_cache: true|g" themes/suka/_config.yml
npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round C'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: on'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: on'
echo ' - Extra config: disable highlight line_number'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i '62,77d' _config.yml
echo 'highlight:
  enable: true
  line_number: false
  auto_detect: false
  tab_replace: true

suka_theme:
  search:
    enable: true
    path: search.json
    field: post # Page | Post | All. Default post
  prism:
    enable: false
    line_number: true
    theme: ghcolors' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round D'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: on'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: on'
echo ' - Extra config: disable highlight tab_replace'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i '62,77d' _config.yml
echo 'highlight:
  enable: true
  line_number: true
  auto_detect: false
  tab_replace: false

suka_theme:
  search:
    enable: true
    path: search.json
    field: post # Page | Post | All. Default post
  prism:
    enable: false
    line_number: true
    theme: ghcolors' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

# Disable Hexo Highlight.js
echo ''
echo '-------------------------------------'
echo '               Round E'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: on'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i '62,77d' _config.yml
echo 'highlight:
  enable: false
  line_number: false
  auto_detect: false
  tab_replace: false

suka_theme:
  search:
    enable: true
    path: search.json
    field: post # Page | Post | All. Default post
  prism:
    enable: false
    line_number: true
    theme: ghcolors' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

# Enable prism highlight
echo ''
echo '-------------------------------------'
echo '               Round F'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: on'
echo ' - suka theme local-search: off'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i '62,77d' _config.yml
echo 'highlight:
  enable: false
  line_number: false
  auto_detect: false
  tab_replace: false

suka_theme:
  search:
    enable: true
    path: search.json
    field: post # Page | Post | All. Default post
  prism:
    enable: true
    line_number: true
    theme: ghcolors' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round G'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: off'
echo '-------------------------------------'
npm run clean > /dev/null
sed -i '62,77d' _config.yml
echo 'highlight:
  enable: false
  line_number: false
  auto_detect: false
  tab_replace: false

suka_theme:
  search:
    enable: false
    path: search.json
    field: post # Page | Post | All. Default post
  prism:
    enable: false
    line_number: true
    theme: ghcolors' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round H1'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: off'
echo ''
echo ' - Extra plugin: hexo-filter-auto-spacing'
echo '-------------------------------------'
npm run clean > /dev/null

npm i hexo-filter-auto-spacing --save &>/dev/null

echo '-------------------------------------'

npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round H2'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: off'
echo ''
echo ' - Extra plugin: hexo-generator-better-sitemap'
echo '-------------------------------------'
npm run clean > /dev/null

npm uninstall hexo-filter-auto-spacing --save &>/dev/null
npm i hexo-generator-better-sitemap --save &>/dev/null

echo '-------------------------------------'

npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round H3'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: off'
echo ''
echo ' - Extra plugin: hexo-generator-feed'
echo '-------------------------------------'

npm run clean > /dev/null

npm uninstall hexo-generator-better-sitemap --save &>/dev/null
npm i hexo-generator-feed --save &>/dev/null

echo '-------------------------------------'

echo '
# RSS
feed:
  type: atom
  path: atom.xml
  limit: 100
  hub:' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

echo ''
echo '-------------------------------------'
echo '               Round H4'
echo ' - fragment_fache: on'
echo ' - hexo built in highlight.js: off'
echo ' - suka theme prism highlight: off'
echo ' - suka theme local-search: off'
echo ''
echo ' - Extra plugin: hexo-filter-nofollow'
echo '-------------------------------------'

npm run clean > /dev/null

npm uninstall hexo-generator-feed --save &>/dev/null
npm i hexo-nofollow --save &>/dev/null

echo '-------------------------------------'

echo '
nofollow:
  enable: true
  exclude:
    - skk.moe
    - blog.skk.moe
    - theme-suka.skk.moe' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'

npm uninstall hexo-nofollow --save &>/dev/null
