rm -rf ./_site
elmstatic build

find . -type f -name "*.html" -print0 | xargs -0 sed -i 's/<meta charset="utf-8">/<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">/g'

#echo "Removendo links na página do curso de Clojure"
#sed -i 's/<a[^>]*>/<b>/g' ./_site/clojure/index.html 
#sed -i 's/<\/a[^>]*>/<\/b>/g' ./_site/clojure/index.html

echo "Removendo link do título na página do curso de Clojure"
sed -i '0,/<a[^>]*>/s//<b>/' ./_site/clojure/index.html 
sed -i '0,/<\/a[^>]*>/s//<\/b>/' ./_site/clojure/index.html

echo "Removendo link da transparencia"
sed -i 's|<a href="#Clojure: Introdução à Programação Funcional-Transparência">Transparência</a>|<b>Transparência</b>|' ./_site/clojure/index.html 

echo "Adicionando favicon personalizado para curso de Clojure"
sed -i 's#</head>#<link rel="shortcut icon" type="image/x-icon" href="/clojure/favicon.ico" /></head>#g' ./_site/clojure/index.html

echo "Copiando feedrss"
cp _site/rss.xml _site/feedrss.xml

echo "Build finalizada"
