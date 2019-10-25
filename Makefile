.PHONY=build clean

VERSION    := HEAD

CHANGELOG  := usr/share/doc/cruft-utils/changelog.Debian.gz

MANPAGES   := $(wildcard manpages/*)
MANPAGES   := $(patsubst manpages/%,usr/share/man/man1/%,$(MANPAGES))
MANPAGES   := $(addsuffix .1.gz,$(MANPAGES))

CONFIG_DIR := usr/lib/cruft-utils

build: $(MANPAGES) $(CHANGELOG) $(CONFIG_DIR)

$(CHANGELOG): debian/changelog
	mkdir -vp $(dir $@)
	gzip -kc $< >$@

$(CONFIG_DIR):
	mkdir -vp $@

usr/share/man/man1/%.1.gz: manpages/%
	mkdir -vp $(dir $@)
	sed "/^.TH/c .TH man 1 \"$(date -I)\" \"$(VERSION)\" \"$(notdir $<)\"" $< | gzip >$@

test:

clean:
	rm -f $(MANPAGES)
	find usr -depth -type d -empty -delete

manifest:

