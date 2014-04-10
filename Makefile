## ------------------------------------------------------------------ [ Crypto ]
##
## Author: Jan de Muijnck-Hughes
##   Date: 2014-01-14
##

IDRIS := idris
PKG   := cryptotypes

build: clean
	$(IDRIS) --build ${PKG}.ipkg

check: build
	$(IDRIS) --checkpkg ${PKG}.ipkg

clean: .PHONY
	$(IDRIS) --clean ${PKG}.ipkg
	find . -name "*~" -delete

install: clean
	$(IDRIS) --install ${PKG}.ipkg

.PHONY:

## --------------------------------------------------------------------- [ EOF ]
