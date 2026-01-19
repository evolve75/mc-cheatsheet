NAME := mc-cheatsheet
TEX  := $(NAME).tex
PDF  := $(NAME).pdf
BOOK := $(NAME)-booklet.pdf

.PHONY: all pdf booklet clean distclean hooks

all: pdf

pdf:
	latexmk -pdf -xelatex $(TEX)

booklet: pdf
	# 2-up imposed booklet for US Letter, short-edge duplex folding
	pdfbook2 --paper=letterpaper $(PDF)
	# pdfbook2 outputs "$(NAME)-book.pdf" by default; normalize name:
	@if [ -f "$(NAME)-book.pdf" ]; then mv "$(NAME)-book.pdf" "$(BOOK)"; fi

hooks:
	@mkdir -p .githooks
	@git config core.hooksPath .githooks
	@command -v pre-commit >/dev/null 2>&1 && pre-commit install || true
	@echo "Hooks configured (core.hooksPath=.githooks)."

clean:
	latexmk -c

distclean:
	latexmk -C
	rm -f $(BOOK)
