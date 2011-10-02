#############################################################
#
# libtheora
#
#############################################################
LIBTHEORA_VERSION = 1.0
LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
LIBTHEORA_INSTALL_STAGING = YES

LIBTHEORA_CONF_OPT = \
		--disable-oggtest \
		--disable-vorbistest \
		--disable-sdltest \
		--disable-examples \
		HAVE_DOXYGEN=false HAVE_PDFLATEX=no
# Note: There is no configure option to disable the building of the
#       documentation, so we do it indirectly by pretending the necessary
#       tools are not there.

LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config

$(eval $(call AUTOTARGETS,package/multimedia,libtheora))
