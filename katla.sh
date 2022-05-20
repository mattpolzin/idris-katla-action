#!/usr/bin/env bash
# fail if any commands fails
set -e

##
## INPUTS
## - $INPUT_MARKDOWN_PATH - './' by default. The location from which all Markdown files will be read in.
## - $INPUT_HTML_PATH     - './html' by default. The location where all output HTML files will be saved.
##
## OUTPUTS
## N/A
##

MARKDOWN_PATH="${INPUT_MARKDOWN_PATH:-./}"

HTML_PATH=${INPUT_HTML_PATH:-./html}

echo "here"
echo "$(ls)"
cd "$MARKDOWN_PATH"

find source -name "*.md" >tmp
 while IFS= read -r rawfile; do
     file=$(echo "$rawfile" | sed "s|source/\(.*\)|\1|")
     filename=$(basename "$file" ".md")
     filedir=$(dirname "$file")
     htmldir="$HTML_PATH/${filedir}"
     mdfile="${htmldir}/${filename}.md"
     htmlfile="${htmldir}/${filename}.html"
     mkdir -p "${htmldir}"
     idris2 -c "${rawfile}"
     katla markdown "$rawfile" "build/ttc/source/${filename}.ttm" >"$mdfile"
     markdown "$mdfile" >"$htmlfile"
 done <tmp
 rm tmp

