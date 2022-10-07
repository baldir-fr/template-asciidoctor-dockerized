all: 01-slides 01-pdf 01-epub 01-docbook
.PHONY: 01-slides

01-slides :
	docker compose run --rm build-slides; rm -rf docs/assets; cp -r 01-slides/assets docs/
01-pdf:
	docker compose run --rm build-pdf
01-epub:
	docker compose run --rm build-epub
01-docbook:
	docker compose run --rm build-docbook
01-docx:
	pandoc --from docbook --to docx --toc --highlight-style tango -o docs/output.docx docs/output.docbook.xml --resource-path=docs