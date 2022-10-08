#!/bin/sh

OUTPUT_DOCX_FILE="docs/output.docx"
INPUT_DOCBOOK_FILE="docs/output.docbook.xml"


echo "Generating .docx document..."
echo "- input:  $INPUT_DOCBOOK_FILE"
echo "- output: $OUTPUT_DOCX_FILE"

pandoc --from docbook --to docx \
  --toc \
  --highlight-style tango \
  -o $OUTPUT_DOCX_FILE \
  --resource-path=docs \
  $INPUT_DOCBOOK_FILE


echo "End of generation."
