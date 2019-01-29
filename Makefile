PREFIX?=/usr/local
BINPREFIX?=$(PREFIX)/bin
LIBPREFIX?=$(PREFIX)/lib/fulgurate
MANPREFIX?=$(PREFIX)/man
DOCPREFIX?=$(PREFIX)/share/doc/fulgurate

PROGS=$(addprefix fulgurate-, run import show-schedule)
MANPAGES=fulgurate.1 $(addsuffix .1, $(PROGS))
DOCS=example.tsv example-filter.sh example-finish.sh

install:
	mkdir -p $(LIBPREFIX)
	cp -f *.py $(PROGS) $(LIBPREFIX)
	chmod ug+x $(addprefix $(LIBPREFIX)/, $(PROGS))
	mkdir -p $(MANPREFIX)/man1
	cp -f $(MANPAGES) $(MANPREFIX)/man1
	mkdir -p $(BINPREFIX)
	for bin in $(PROGS); do ln -f -s $(LIBPREFIX)/$$bin $(BINPREFIX)/$$bin; done
	mkdir -p $(DOCPREFIX)
	cp -f $(DOCS) $(DOCPREFIX)

clean:
	rm -rf *.pyc
