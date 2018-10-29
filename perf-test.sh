#!/bin/sh
# Import 300 Posts
echo ''
echo '-------------------------------------'
echo 'Importing 300 posts ...'
echo '-------------------------------------'
echo ''
cd source/_posts/
git clone https://github.com/SukkaLab/hexo-5000-posts.git --depth=1
cd ..
cd ..

# Disable fragment cache
echo ''
echo '-------------------------------------'
echo 'Test performance: 300 posts without fragment_cache'
echo '-------------------------------------'
echo ''
npm run clean > /dev/null
sed -i "s|fragment_cache: true|fragment_cache: false|g" themes/suka/_config.yml
npm run generate > perf.log
cat perf.log | grep 'generated in'

# Enable fragment cache
echo ''
echo '-------------------------------------'
echo 'Test performance: 300 posts with fragment_cache'
echo '-------------------------------------'
echo ''
npm run clean > /dev/null
sed -i "s|fragment_cache: false|fragment_cache: true|g" themes/suka/_config.yml
npm run generate > perf.log
cat perf.log | grep 'generated in'

# Disable Hexo Highlight.js
echo ''
echo '-------------------------------------'
echo 'Test performance: 300 posts with fragment_cache enabled and highlight.js disabled'
echo '-------------------------------------'
echo ''
npm run clean > /dev/null

sed -i '40,44d' _config.yml
echo '
highlight:
  enable: false
  line_number: false
  auto_detect: false
  tab_replace: false' >> _config.yml

npm run generate > perf.log
cat perf.log | grep 'generated in'
