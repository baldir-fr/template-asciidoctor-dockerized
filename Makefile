all: 01-slides 01-pdf 01-epub 01-docbook
.PHONY: 01-slides

01-slides:
	docker compose run --rm build-slides; rm -rf docs/assets; cp -r 01-slides/assets docs/
01-pdf:
	docker compose run --rm build-pdf
01-epub:
	docker compose run --rm build-epub
01-docbook:
	docker compose run --rm build-docbook
01-docx:
	pandoc --from docbook --to docx --toc --highlight-style tango -o docs/output.docx docs/output.docbook.xml --resource-path=docs

ci-01-slides:
	asciidoctor-revealjs -a revealjsdir=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.9.2 01-slides/index.adoc -o docs/index.html; rm -rf docs/assets; cp -r 01-slides/assets docs/
ci-01-pdf:
	asciidoctor-pdf 01-slides/index.adoc -o docs/output.pdf
ci-01-epub:
	asciidoctor-epub3 01-slides/index.adoc -o docs/output.epub
ci-01-docbook:
	asciidoctor -b docbook 01-slides/index.adoc -o docs/output.docbook.xml
ci-01-docx:
	pandoc --from docbook --to docx --toc --highlight-style tango -o docs/output.docx docs/output.docbook.xml --resource-path=docs

# Can be launched from docker image : `asciidoctor/docker-asciidoctor`
ci-adoc: ci-01-slides ci-01-pdf ci-01-epub ci-01-docbook

ci-pandoc: ci-01-docx

