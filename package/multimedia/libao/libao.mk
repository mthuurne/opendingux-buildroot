#############################################################
#
# libao
#
#############################################################

LIBAO_VERSION = 1.1.0
LIBAO_SOURCE = libao-$(LIBAO_VERSION).tar.gz
LIBAO_SITE = http://downloads.xiph.org/releases/ao
LIBAO_AUTORECONF = NO
LIBAO_INSTALL_STAGING = YES
LIBAO_INSTALL_TARGET = YES

LIBAO_CONF_OPT = --disable-esd
LIBAO_DEPENDENCIES =
ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
LIBAO_CONF_OPT += --enable-alsa
else
LIBAO_CONF_OPT += --disable-alsa
LIBAO_DEPENDENCIES += alsa-lib
endif

$(eval $(call AUTOTARGETS,package/multimedia,libao))
