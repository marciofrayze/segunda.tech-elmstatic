elmstatic build

find . -type f -name "*.html" -print0 | xargs -0 sed -i 's/<meta charset="utf-8">/<meta charset="utf-8"><meta name="viewport" content="width=500, initial-scale=1">/g'

cp _site/rss.xml _site/feedrss.xml
