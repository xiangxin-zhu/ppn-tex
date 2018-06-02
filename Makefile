NAME = main

OS_TYPE := $(shell uname -s)
ifeq ($(OS_TYPE), Linux)
  VIEWER = evince
endif
ifeq ($(OS_TYPE), Darwin)
  VIEWER = open
endif

$(NAME).pdf : *.bib *.tex figure/*.*
	-pdflatex  $(NAME).tex
	-bibtex  $(NAME)
	-pdflatex  $(NAME).tex
	-pdflatex  $(NAME).tex

show:
	$(VIEWER) $(NAME).pdf &

clean:
	-rm -rf $(NAME).pdf $(NAME).aux $(NAME).log $(NAME).bbl $(NAME).blg $(NAME).brf
