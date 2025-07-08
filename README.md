# Building Image

Build the image (where `XX.YY.ZZ` is the version, usually the current date, e.g. `24.04.06` means April 6, 2024)

```bash
docker build --tag "mionita1980/mindit-markdown-compiler:latest" --tag "mionita1980/mindit-markdown-compiler:XX.YY.ZZ" .
```

Upload the image to the [Docker](http://hub.docker.com) repo.


# Usage

Make sure to use the latest version (replace `latest` with a specific version, if desired)

```bash
docker run --rm -v $(pwd):/documents/ mionita1980/mindit-markdown-compiler:latest index.md
```


## Sample Markdown File

```markdown
---
title: "My Test"
author: [Mihai]
date: "July 8th, 2025"
lang: "en"
watermark: ""
header-left: "\\hspace{1cm}"
header-center: "\\leftmark"
footer-left: "\\thepage"
footer-center: "mindit.io"
footer-right: "(c) 2025"
page-background: "mindit.pdf"
...

# My Test

Currently the document contains:

- this
- that
    > That is a sample.
```
