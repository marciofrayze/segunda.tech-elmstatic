rm -rf ./_site
elmstatic build

find . -type f -name "*.html" -print0 | xargs -0 sed -i 's/<meta charset="utf-8">/<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">/g'

echo "Removendo links na página do curso de Clojure"
sed -i 's/<a[^>]*>/<b>/g' ./_site/clojure/index.html 
sed -i 's/<\/a[^>]*>/<\/b>/g' ./_site/clojure/index.html

cp _site/rss.xml _site/feedrss.xml
