################################################################################
#
# eina -- EFL EET library
#
################################################################################

EET_VERSION = 1.6.0
EET_SOURCE = eet-$(EET_VERSION).tar.bz2
EET_SITE = http://download.enlightenment.org/releases/
EET_AUTORECONF = NO
EET_INSTALL_STAGING = YES
EET_INSTALL_TARGET = YES
EET_DEPENDENCIES = host-pkg-config eina zlib

ifeq ($(BR2_PACKAGE_EET_EXAMPLES),y)
EET_CONF_OPT += --enable-build-examples
endif

ifeq ($(BR2_PACKAGE_EET_COVERAGE),y)
EET_CONF_OPT += --enable-coverage
endif

ifeq ($(BR2_PACKAGE_EET_TESTS),y)
EET_CONF_OPT += --enable-tests
endif

ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
EET_DEPENDENCIES += libgcrypt
endif

ifeq ($(BR2_PACKAGE_OPENSSL),y)
EET_DEPENDENCIES += openssl
endif

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
