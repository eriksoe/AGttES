all: OOP.html

clean:
	rm *.html || true

%.html: %.asciidoc
	asciidoc $<
