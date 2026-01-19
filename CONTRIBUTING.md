# Contributing

Thanks for helping improve the **Midnight Commander (mc) cheatsheet**! This project is intentionally small and
Makefile-driven so builds are reproducible locally and in CI.

## Quick start

Build the 4-page PDF:

```sh
make pdf
```

Build the **booklet-imposed** PDF (duplex short-edge printing):

```sh
make booklet
```

## Hooks (recommended)

This repo uses **repo-local hooks** stored in `.githooks/` so the behavior is consistent across macOS and Linux.

Enable them once per clone:

```sh
make hooks
```

This is not **idempotent**.

Hooks installed:

- `pre-commit`: runs `pre-commit` checks if available (non-blocking if not installed).
- `pre-push`: runs `make booklet` when relevant files changed, preventing broken PDFs from being pushed.

## Tooling

### macOS (Homebrew)

TeX (XeLaTeX + latexmk):

```sh
brew install --cask mactex-no-gui
```

Booklet imposition tools (`pdfbook2`):

```sh
brew install pdfjam
```

Optional linting tools:

```sh
brew install pre-commit chktex
```

### Linux

Package names vary by distro. Examples:

**Debian/Ubuntu**

```sh
sudo apt update
sudo apt install latexmk texlive-xetex texlive-latex-extra texlive-extra-utils chktex
```

**Fedora**

```sh
sudo dnf install latexmk texlive-scheme-basic texlive-xetex texlive-collection-latexextra texlive-pdfjam chktex
```

**Arch**

```sh
sudo pacman -S texlive-bin texlive-core texlive-latexextra chktex
```

## Printing checklist

- Build: `make booklet`
- Print file: `mc-cheatsheet-booklet.pdf`
- Duplex: **ON**
- Binding: **Short-edge**
- Scaling: **100% / Actual size**
- Printer booklet mode: **OFF**
- Test-print a single sheet to confirm orientation before laminating.

## CI

CI runs on GitHub Actions in a TeX Live container and can commit regenerated PDFs back to `main`.
If you change `mc-cheatsheet.tex` or the `Makefile`, ensure `make booklet` succeeds locally.
