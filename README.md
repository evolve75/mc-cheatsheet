# Midnight Commander (mc) Cheatsheet

This repository contains a LaTeX formatted, print-ready **Midnight Commander (mc) cheatsheet**,
designed for terminal users who want a compact, authoritative reference that works equally well
on screen and as a **laminated, folded booklet**.

The cheatsheet fits into **4 logical US Letter pages**, intended to be printed **duplex, 2-up, short-edge**
and folded at the center.

---

## Features

- Comprehensive mc keybindings and workflows
- Panels, menus, VFS (archives, `sh://`, `sftp://`, EXTfs, undelete)
- Viewer/editor essentials
- User menu macros and panelize recipes
- Configuration paths and troubleshooting tips
- Tasteful, print-safe color scheme
- Optimized margins for lamination and folding
- ChkTeX-clean, XeLaTeX-based source

---

## Files

- `mc-cheatsheet.tex` — main LaTeX source
- `mc-cheatsheet.pdf` — compiled 4-page PDF
- `mc-cheatsheet-booklet.pdf` — imposed booklet (generated via `pdfbook2`)
- `Makefile` - For generating the PDFs using the LaTeX toolchain
- `README.md` — this file

---

## Required Software

### LaTeX toolchain (macOS & Linux)

You need a **XeLaTeX-capable TeX distribution**:

- **macOS**
  - MacTeX
    <https://tug.org/mactex/>

- **Linux**
  - TeX Live (full or sufficiently complete)
    - Debian/Ubuntu: `texlive-full`
    - Fedora: `texlive-scheme-full`
    - Arch: `texlive-most`

Required LaTeX packages include (normally bundled):
- `fontspec`
- `geometry`
- `multicol`
- `booktabs`
- `array`
- `xcolor`
- `hyperref`
- `bookmark`
- `fancyhdr`
- `enumitem`
- `xurl`

---

### PDF imposition (booklet generation)

You must install **pdfbook2** (from pdfjam):

- **macOS**
  ```sh
  brew install pdfjam
  ```

- **Linux**
  - Debian/Ubuntu:
    ```sh
    sudo apt install pdfjam
    ```
  - Fedora:
    ```sh
    sudo dnf install texlive-pdfjam
    ```

References:
- https://www.ctan.org/pkg/pdfjam

---

## Building the PDF

From the project directory:

```sh
latexmk -pdf -xelatex mc-cheatsheet.tex

# or

make
```

This produces:

```text
mc-cheatsheet.pdf
```

(4 logical pages, **not yet imposed**)

---

## Creating the Booklet

Use **short-edge duplex imposition**:

```sh
pdfbook2 --paper=letterpaper --short-edge mc-cheatsheet.pdf

# or

make booklet
```

This produces:

```text
mc-cheatsheet-booklet.pdf
```

---

## Quick Print Checklist (TL;DR)

Before printing, verify **all** of the following:

- ☐ File to print: `mc-cheatsheet-booklet.pdf`
- ☐ Paper size: **US Letter**
- ☐ Duplex printing: **ON**
- ☐ Duplex mode: **Short-edge binding**
- ☐ Scaling: **100% / Actual size**
- ☐ Orientation: **Auto**
- ☐ Printer booklet mode: **OFF**
- ☐ Color printing: **ON** (even if subtle)
- ☐ First test page checked for correct orientation

After printing:

- ☐ Fold pages at the center
- ☐ Verify page order (1 → 2 → 3 → 4)
- ☐ Trim edges if desired
- ☐ Laminate (recommended)

---

## Printing Notes

- Do **not** use printer-side booklet mode.
- Using long-edge duplex will result in upside-down pages.
- Always test-print a single sheet before committing.
- Colors are intentionally conservative but should still be visible.

---

## Recommended Lamination

- 3–5 mil pouches
- Laminate **after folding and trimming**
- Colors and contrast are tuned to survive lamination glare

---

## Content Sources and Attribution

This cheatsheet is compiled from primary and authoritative sources:

- Midnight Commander manual page
  <https://source.midnight-commander.org/man/mc.html>

- Official Midnight Commander website
  <https://midnight-commander.org/>

- Community cheatsheet by Samir Aguiar
  <https://gist.github.com/samiraguiar/9cd4264445545cfd459d>

Content has been curated, cross-checked, reorganized, and expanded for
accuracy and completeness as best as possible, but errors might exist.

---

## License

This cheatsheet is provided for **personal and educational use**.
Refer to upstream sources for licensing of original content.

---

## Notes

- The document is optimized for **XeLaTeX**
- Colors are intentionally conservative for print reliability
- Man-page references use canonical `mc(1)` notation

Enjoy using **Midnight Commander** more efficiently!
