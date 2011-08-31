################################################################################
#
# eina -- EFL EINA library
#
################################################################################

EINA_VERSION = 1.2.0
EINA_SOURCE = eina-$(EINA_VERSION).tar.bz2
EINA_SITE = http://download.enlightenment.org/releases/
EINA_INSTALL_STAGING = YES
EINA_INSTALL_TARGET = YES
EINA_DEPENDENCIES = host-pkg-config

ifeq ($(BR2_PACKAGE_EINA_TESTS),y)
EINA_CONF_OPT += --enable-tests
endif

ifeq ($(BR2_PACKAGE_EINA_COVERAGE),y)
EINA_CONF_OPT += --enable-coverage
endif

ifeq ($(BR2_PACKAGE_EINA_BENCHMARK),y)
EINA_CONF_OPT += --enable-benchmark
endif


$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
