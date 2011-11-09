################################################################################
#
# evas -- EFL EVAS library
#
################################################################################

EVAS_VERSION = 1.0.0
EVAS_SOURCE = evas-$(EVAS_VERSION).tar.gz
EVAS_SITE = http://download.enlightenment.org/releases/
EVAS_AUTORECONF = NO
EVAS_INSTALL_STAGING = YES
EVAS_INSTALL_TARGET = YES
EVAS_DEPENDENCIES = host-pkg-config freetype eina
HOST_EVAS_DEPENDENCIES = host-pkg-config host-freetype host-eina host-libpng

ifeq ($(BR2_PACKAGE_EVAS_EXAMPLES),y)
EVAS_CONF_OPT += --enable-build-examples
endif

ifeq ($(BR2_PACKAGE_EET),y)
EVAS_DEPENDENCIES += eet
endif

ifeq ($(BR2_PACKAGE_LIBPNG),y)
EVAS_DEPENDENCIES += libpng
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
EVAS_DEPENDENCIES += jpeg
endif

ifeq ($(BR2_PACKAGE_TIFF),y)
EVAS_DEPENDENCIES += tiff
endif

$(eval $(call AUTOTARGETS,package/efl,evas))
$(eval $(call AUTOTARGETS,package/efl,evas,host))
