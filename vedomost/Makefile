TEX         = $(wildcard *.tex)
PDF         = $(subst .tex,.pdf,$(TEX))
STA         = $(subst .tex,.stat,$(TEX))

STAT        = perl makestat.pl

default: pdf stat

pdf: $(PDF)
stat: $(STA)

%.pdf: %.tex %.stat %.inc FORCE
	pdflatex $<

%.stat: %.idx
	 $(STAT) < $< > $@

%.idx: %.tex
	-pdflatex -halt-on-error -interaction=nonstopmode $<

clean:
	rm -f .*~ *~ *.aux *.idx *.ilg *.log *.stat

FORCE:

.PHONY: pdf clean

