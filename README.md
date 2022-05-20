# idris-katla-action

A small wrapper that runs Katla against all Markdown Literate-Idris files in a given directory and then converts to HTML.

Credit goes to @gallias for the setup used in this action.

For example,
```yaml
jobs:
  html:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: mattpolzin/idris-katla-action@0.1.0
      with:
        MARKDOWN_PATH: md/
        HTML_PATH: html/
```

Inputs:
- `MARKDOWN_PATH`: `./` by default. The location from which all Markdown files will be read in.
- `HTML_PATH`: `./html` by default. The location where all output HTML files will be saved.

Outputs:
N/A

## Full Example
Now that you've got HTML, you might also want to publish it to your gh-page for the repo.

Here's a full workflow for that:
```yaml
jobs:
  html:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: mattpolzin/idris-katla-action@0.1.0
      with:
        MARKDOWN_PATH: md/
        HTML_PATH: html/
    - uses: JamesIves/github-pages-deploy-action@4.1.3
      with:
        branch: gh-pages
        folder: html/
        git-config-name: Github Actions
```

