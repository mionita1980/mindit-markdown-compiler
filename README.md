#mindit Markdown Compiler

## Building Image

Build the image (where `XX.YY.ZZ` is the version, usually the current date, e.g. `24.04.06` means April 6, 2024)

```bash
docker build --tag "mionita1980/mindit-markdown-compiler:latest" --tag "mionita1980/mindit-markdown-compiler:XX.YY.ZZ" .
```

Upload the image to the [Docker](http://hub.docker.com) repo.

## Usage

Use from Linux or WSL command prompt (you must run this command from the folder where your markdown file is located):

```bash
docker run --rm -v $(pwd):/documents/ mionita1980/mindit-markdown-compiler:latest index.md
```

Use from powershell Windows command prompt (you must run this command from the folder where your markdown file is located):

```powershell
docker run --rm -v .:/documents/ mionita1980/mindit-markdown-compiler:latest index.md
```

## Sample Markdown File

```markdown
---
title: "My Test"
author: [Mihai]
date: "July 8th, 2025"
subject: "Technical Solution Description"
keywords: [Test, Document, Mihai]
lang: "en"
watermark: ""
header-left: "\\hspace{1cm}"
header-center: "\\thetitle"
footer-left: "\\thepage"
footer-center: "mindit.io"
footer-right: "(c) 2025"
page-background: "mindit.pdf"
papersize: a4
numbersections: true
geometry: "left=1.5cm,right=1.5cm,top=2.5cm,bottom=2.5cm"
header-includes:
  - \usepackage{enumitem}
  - \setlistdepth{20}
  - \renewlist{itemize}{itemize}{20}
  - \renewlist{enumerate}{enumerate}{20}
  - \setlist[itemize]{label=$\cdot$}
  - \setlist[itemize,1]{label=$\cdot$}
  - \setlist[itemize,2]{label=$\cdot$}
  - \setlist[itemize,3]{label=$\cdot$}
  - \setlist[itemize,4]{label=$\cdot$}
  - \setlist[itemize,5]{label=$\cdot$}
  - \setlist[itemize,6]{label=$\cdot$}
  - \setlist[itemize,7]{label=$\cdot$}
...

# My Test

Currently the document contains:

- this
- that
    > That is a sample.
```


## Known (Solved) Issues

With the plantuml version that ubuntu provides (apt install), you get errors like `Fatal parsing error $elementSkin` while creating images from C4 plantuml diagrams.  
See https://github.com/plantuml-stdlib/C4-PlantUML/issues/198.

Fixed by using the latest plantuml `.jar` file, which gets downloaded during the build (see `./Dockerfile`).
