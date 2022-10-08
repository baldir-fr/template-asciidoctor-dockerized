all: dc-slides dc-pdf dc-epub dc-docbook

dc-slides:
	docker compose run --rm build-slides; rm -rf docs/assets; cp -r _content/assets docs/
dc-pdf:
	docker compose run --rm build-pdf
dc-epub:
	docker compose run --rm build-epub
dc-docbook:
	docker compose run --rm build-docbook
dc-docx:
	docker compose run --rm build-docx

all-no-docker: slides pdf epub docbook docx

slides:
	asciidoctor-revealjs -a revealjsdir=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.9.2 _content/index.adoc -o docs/index.html; rm -rf docs/assets; cp -r _content/assets docs/
pdf:
	asciidoctor-pdf _content/index.adoc -o docs/output.pdf
epub:
	asciidoctor-epub3 _content/index.adoc -o docs/output.epub
docbook:
	asciidoctor -b docbook _content/index.adoc -o docs/output.docbook.xml
docx:
	./generate-docx.sh

# In CI, all asciidoctor make targets can be launched from the docker image : `asciidoctor/docker-asciidoctor`
ci-adoc: slides pdf epub docbook

