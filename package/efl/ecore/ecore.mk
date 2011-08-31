################################################################################
#
# ecore -- EFL ECORE library
#
################################################################################

ECORE_VERSION = 1.2.0
ECORE_SOURCE = ecore-$(ECORE_VERSION).tar.bz2
ECORE_SITE = http://download.enlightenment.org/releases/
ECORE_AUTORECONF = NO
ECORE_INSTALL_STAGING = YES
ECORE_INSTALL_TARGET = YES
ECORE_DEPENDENCIES = host-pkg-config eina evas

ifeq ($(BR2_PACKAGE_ECORE_ENABLE-G-MAIN-LOOP),y)
ECORE_CONF_OPT += --enable-g-main-loop
endif

$(eval $(call AUTOTARGETS,package/efl,ecore))
$(eval $(call AUTOTARGETS,package/efl,ecore,host))
