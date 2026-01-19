NAME := mc-cheatsheet
TEX  := $(NAME).tex
PDF  := $(NAME).pdf
BOOK := $(NAME)-booklet.pdf

# Build artifacts are produced only when inputs change; booklet
# imposition is done via pdfbook2.

.PHONY: all pdf booklet clean distclean hooks view

all: $(BOOK)

# Build the PDF only when inputs change (XeLaTeX via latexmk)
$(PDF): $(TEX) $(wildcard .latexmkrc)
	latexmk -pdf -xelatex $(TEX)

# Convenience alias
pdf: $(PDF)

# Build booklet only when the PDF changes
$(BOOK): $(PDF)
	# 2-up imposed booklet for US Letter, short-edge duplex folding
	pdfbook2 --paper=letterpaper --short-edge $(PDF)
	# pdfbook2 outputs "$(NAME)-book.pdf" by default; normalize the name:
	@if [ -f "$(NAME)-book.pdf" ]; then mv "$(NAME)-book.pdf" "$(BOOK)"; fi

# Convenience alias
booklet: $(BOOK)

# Open the booklet PDF using the platform default viewer (macOS / Linux)
view: $(BOOK)
	@command -v open >/dev/null 2>&1 && open $(BOOK) || \
	 command -v xdg-open >/dev/null 2>&1 && xdg-open $(BOOK) || \
	 echo "No suitable PDF viewer found (tried open, xdg-open)."

clean:
	latexmk -c

distclean:
	latexmk -C
	rm -f $(BOOK) $(PDF) $(NAME)-book.pdf $(NAME)-crop.pdf

hooks:
	@mkdir -p .githooks
	@git config core.hooksPath .githooks
	@command -v pre-commit >/dev/null 2>&1 && pre-commit install || true
	@echo "Hooks configured (core.hooksPath=.githooks)."
