#!/bin/bash

# Run fff to requests all paths
cat paths.txt | ~/tools/tomnomnom/fff --save --delay 1000 --keep-alive --output output/out.$(date +%d%m%Y%H%M)
# Diff last two folders to check for differences
diff -rq -x \*.headers output/$(ls -t1 output/ | head -n 1) output/$(ls -t1r output/ | tail -n 2 | head -n 1) > results/random.$(date +%d%m%Y%H%M)
# Send changes in slack channel
~/tools/slack file upload --file $(ls -t1 results/random.*  | head -n 1) --channels '#monitor-javascript'
