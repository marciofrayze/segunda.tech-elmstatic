.PHONY: help

help:
	@echo "\n\nComandos disponíveis:\n"
	@echo "run: sobe o servidor de aplicação local.\n"
	@echo "upgrade: atualiza dependências do projeto (iterativamente).\n"
	@echo "build-release: gera build de produção.\n"
	@echo "open-repo: abre página principal do repositório git do projeto\n"
	@echo "build-deploy: compila versão de produção e faz deploy no firebase\n\n"

run:
	rm -rf ./_site
	elmstatic build
	find . -type f -name "*.html" -print0 | xargs -0 sed -i -e 's/<meta charset="utf-8">/<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">/g'
	echo "Copiando feedrss"
	cp _site/rss.xml _site/feedrss.xml
	echo "Build finalizada"
	http-server _site

upgrade:
	elm-json upgrade

build-release:
	rm -rf ./_site
	elmstatic build
	find . -type f -name "*.html" -print0 | xargs -0 sed -i -e 's/<meta charset="utf-8">/<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">/g'
	echo "Copiando feedrss"
	cp _site/rss.xml _site/feedrss.xml
	echo "Build finalizada"

open-repo:
	open https://github.com/marciofrayze/segunda.tech-elmstatic

build-deploy:
	rm -rf ./_site
	elmstatic build
	find . -type f -name "*.html" -print0 | xargs -0 sed -i -e 's/<meta charset="utf-8">/<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">/g'
	echo "Copiando feedrss"
	cp _site/rss.xml _site/feedrss.xml
	echo "Build finalizada"
	cd _site && firebase deploy