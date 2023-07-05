# Pkgsrc Install notes

Basic setup instructions for using pkgsrc with current dotfiles setup.  It uses
the GitHub mirror for packages and downloads and builds the source in the /tmp
directory.  Make sure that the pkgsrc_dir in the variable files matches the
install path. 

***NOTE***:
  - *The /tmp directory needs more then 10G of space.*
  - *The SCL devtoolset-10 (or above needs) to be activated for EL7*

---

1. In <pkgsrc_dir> run `git clone https://github.com/netbsd/pkgsrc.git -b trunk`

2. Bootstrap the system
```
    cd <pkgsrc_dir>/pkgsrc/bootstrap
    ./bootstrap --prefix <pkgsrc_dir>/<os> -unprivileged \
                --make-jobs x --workdir=/tmp/pkgsrc-work
```

3. Modify etc/mk.conf to add the lines

after PKGMANDIR
```
    WRKOBJDIR=		/tmp/pkgsrc-work
    DISTDIR=		/tmp/pkgsrc-distfiles
    PACKAGES=		<pkgsrc_dir>/<os>/packages

    MAKE_JOBS=		4
```
after PREFER_PKGSRC
```
    PKG_DEFAULT_OPTIONS=	-doc
```
