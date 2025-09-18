DESTDIR := $(shell echo $$PWD)
PREFIX := $(shell echo $$(dirname $$PWD))

DUNST    = dunst-1.12.2
FEH      = feh-3.10.3
GHOSTTY  = ghostty-1.1.3
I3       = i3-4.24
PICOM    = picom-12.5
ROFI     = rofi-1.7.5
STOW     = stow-2.4.1
TMUX     = tmux-3.5a
XSS_LOCK = xss-lock-0.3.0+git20230128.0c562b
XSSPROXY = xssproxy-1.1.1


.PHONY: all el9 stow

all: $(DISTRO)

el9: $(DUNST) $(FEH) $(GHOSTTY) $(I3) $(PICOM) $(ROFI) $(STOW) $(TMUX) \
	$(XSS_LOCK) $(XSSPROXY) | /tmp/src


# run target in single shell
.ONESHELL:
.SHELLFLAGS = -ec

$(DUNST):  | Src/$(DUNST).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(DUNST)
	make PREFIX=$(PREFIX) -j
	make PREFIX=$(PREFIX) DESTDIR=/tmp/dunst install
	mkdir $(DESTDIR)/$@
	cp -a /tmp/dunst/$(PREFIX)/* $(DESTDIR)/$@/
	echo -e "etc\nlib" > $(DESTDIR)/$@/.stow-local-ignore
	rm -rf /tmp/dunst /tmp/src/$(DUNST)

$(FEH):  | Src/$(FEH).tar.bz2
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(FEH)
	DESTDIR=/tmp/feh PREFIX=$(PREFIX) make -j
	DESTDIR=/tmp/feh PREFIX=$(PREFIX) make install
	mkdir $(DESTDIR)/$@
	cp -a /tmp/feh/$(PREFIX)/* $(DESTDIR)/$@/
	rm -rf /tmp/feh /tmp/src/$(FEH)

$(GHOSTTY):  | Src/$(GHOSTTY).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(GHOSTTY)
	$(DESTDIR)/Patches/ghostty-epoll.sh
	module load zig/0.13.0
	DESTDIR=/tmp/ghostty zig build --prefix $(PREFIX) -Doptimize=ReleaseFast -Dcpu=baseline
	mkdir $(DESTDIR)/$@
	cp -a /tmp/ghostty/$(PREFIX)/* $(DESTDIR)/$@/
	rm -rf /tmp/ghostty /tmp/src/$(GHOSTTY)

$(I3):  | Src/$(I3).tar.xz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(I3)
	meson setup --prefix $(PREFIX) --buildtype=release build
	meson compile -C build -j -1
	DESTDIR=/tmp/i3 meson install -C build
	mkdir $(DESTDIR)/$@/
	cp -a /tmp/i3/$(PREFIX)/* $(DESTDIR)/$@/
	echo -e "etc\ninclude" > $(DESTDIR)/$@/.stow-local-ignore
	rm -rf /tmp/i3 /tmp/src/$(I3)

$(PICOM):  | Src/$(PICOM).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(PICOM)
	meson setup --prefix $(PREFIX) --buildtype=release build
	meson compile -C build -j -1
	DESTDIR=/tmp/picom meson install -C build
	mkdir $(DESTDIR)/$@/
	cp -a /tmp/picom/$(PREFIX)/* $(DESTDIR)/$@/
	echo -e "etc\nlib64" > $(DESTDIR)/$@/.stow-local-ignore
	rm -rf /tmp/picom /tmp/src/$(PICOM)

$(ROFI):  | Src/$(ROFI).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(ROFI)
	./configure --prefix=$(PREFIX) --disable-check
	make -j
	make prefix=$(DESTDIR)/$@ install
	echo -e "include\nlib" > $(DESTDIR)/$@/.stow-local-ignore
	rm -rf /tmp/src/$(ROFI)

# Compiled for stow prefix not .local prefix, so it can be used
# without being stowed.
$(STOW):  | Src/$(STOW).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(STOW)
	./configure --prefix=$(DESTDIR)/$@
	make install
	rm -rf /tmp/src/$(STOW)

$(TMUX):  | Src/$(TMUX).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(TMUX)
	./configure --prefix=$(PREFIX)
	make -j
	make prefix=$(DESTDIR)/$@ install
	rm -rf /tmp/src/$(TMUX)

$(XSS_LOCK):  | Src/$(XSS_LOCK).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(XSS_LOCK)
	cmake . -DCMAKE_INSTALL_PREFIX=$(PREFIX)
	make -j
	cmake --install . --prefix=$(DESTDIR)/$@
	rm -rf /tmp/src/$(XSS_LOCK)

$(XSSPROXY):  | Src/$(XSSPROXY).tar.gz
	tar -xf $< -C /tmp/src
	cd /tmp/src/$(XSSPROXY)
	make
	install -D xssproxy $(DESTDIR)/$@/bin/xssproxy
	install -D -m644 xssproxy.1.gz $(DESTDIR)/$@/share/man/man1/xssproxy.1.gz
	rm -rf /tmp/src/$(XSSPROXY)


/tmp/src:
	mkdir -p /tmp/src

Src/%.tar.gz:
	./Download.sh $*

Src/%.tar.bz2:
	./Download.sh $*

Src/%.tar.xz:
	./Download.sh $*
