SRCS = $(wildcard *.asciidoc)
DESTS = $(patsubst %.asciidoc,%.html,${SRCS})

all: ${DESTS}

clean:
	rm *.html || true

%.html: %.asciidoc
	asciidoc $<


# Requires Linux's 'inotify-tools':
watch-inotify:
	inotifywait -m . | egrep --line-buffered 'CLOSE.*\.asciidoc$$' | tee /dev/stderr | while read x ; do echo "Updating..." ; ${MAKE} -s >/dev/null; echo -n "Updated " ; date ; done
