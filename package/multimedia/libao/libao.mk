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

define LIBAO_REMOVE_OSS_PLUGIN
	rm -f $(TARGET_DIR)/usr/lib/ao/plugins-4/liboss.so
endef

ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
LIBAO_CONF_OPT += --enable-alsa --enable-alsa-mmap
LIBAO_DEPENDENCIES += alsa-lib
LIBAO_POST_INSTALL_TARGET_HOOKS += LIBAO_REMOVE_OSS_PLUGIN
else
LIBAO_CONF_OPT += --disable-alsa
endif

$(eval $(call AUTOTARGETS,package/multimedia,libao))
