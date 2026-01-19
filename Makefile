NAME := mc-cheatsheet
TEX  := $(NAME).tex
PDF  := $(NAME).pdf
BOOK := $(NAME)-booklet.pdf

.PHONY: all pdf booklet clean distclean

all: pdf

pdf:
	latexmk -pdf -xelatex $(TEX)

booklet: pdf
	# 2-up imposed booklet for US Letter, short-edge duplex folding
	pdfbook2 --paper=letterpaper $(PDF)
	# pdfbook2 outputs "$(NAME)-book.pdf" by default; normalize name:
	@if [ -f "$(NAME)-book.pdf" ]; then mv "$(NAME)-book.pdf" "$(BOOK)"; fi

clean:
	latexmk -c

distclean:
	latexmk -C
	rm -f $(BOOK)
