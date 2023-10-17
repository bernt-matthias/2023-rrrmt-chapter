all: x-cut-chapter.pdf

x-cut-chapter.pdf: x-cut-chapter.tex dcj_overview.bib
	pdflatex -halt-on-error x-cut-chapter
	bibtex x-cut-chapter
	pdflatex -halt-on-error x-cut-chapter
	pdflatex -halt-on-error x-cut-chapter
	pdflatex -halt-on-error x-cut-chapter


.PHONY: clean

clean: 
	rm -f x-cut-chapter.aux x-cut-chapter.bbl x-cut-chapter.blg x-cut-chapter.dvi x-cut-chapter.log x-cut-chapter.out x-cut-chapter.pdf

watch:
	while :; do  inotifywait -e modify x-cut-chapter.tex dcj_overview.bib; make; done

