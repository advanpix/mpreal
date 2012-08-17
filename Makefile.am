AUTOMAKE_OPTIONS = subdir-objects
ACLOCAL_AMFLAGS = "${ACLOCAL_FLAGS}"

lib_LTLIBRARIES = libmpfrc++.la
libmpfrc___la_SOURCES = mpreal.cpp
libmpfrc___la_LDFLAGS = -version-info $(MPFRCPP_SO_VERSION) -lmpfr -lgmp

mpfrcpp_includedir = $(includedir)
mpfrcpp_include_HEADERS = mpreal.h
