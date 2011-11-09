################################################################################
#
# edje -- EFL EDJE library
#
################################################################################

EDJE_VERSION = 1.0.0
EDJE_SOURCE = edje-$(EDJE_VERSION).tar.gz
EDJE_SITE = http://download.enlightenment.org/releases/
EDJE_AUTORECONF = NO
EDJE_INSTALL_STAGING = YES
EDJE_INSTALL_TARGET = YES
EDJE_DEPENDENCIES = host-pkg-config fontconfig freetype lua eina evas eet embryo ecore
EDJE_CONF_OPT += --enable-fixed-point \
				 --disable-edje-cc \
				 --disable-edje-decc \
				 --disable-edje-recc \
				 --disable-edje-player \
				 --disable-edje-inspector \
				 --disable-edje-external-inspector

ifeq ($(BR2_PACKAGE_EDJE_AMALGAMATION),y)
EDJE_CONF_OPT += --enable-amalgamation
endif

HOST_EDJE_DEPENDENCIES = host-pkg-config host-fontconfig host-lua host-eina host-evas host-eet host-embryo host-ecore

$(eval $(call AUTOTARGETS,package/efl,edje))
$(eval $(call AUTOTARGETS,package/efl,edje,host))
