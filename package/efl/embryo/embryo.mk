################################################################################
#
# embryo -- EFL EMBRYO library
#
################################################################################

EMBRYO_VERSION = 1.0.0
EMBRYO_SOURCE = embryo-$(EMBRYO_VERSION).tar.gz
EMBRYO_SITE = http://download.enlightenment.org/releases/
EMBRYO_AUTORECONF = NO
EMBRYO_INSTALL_STAGING = YES
EMBRYO_INSTALL_TARGET = YES
EMBRYO_DEPENDENCIES = host-pkg-config

$(eval $(call AUTOTARGETS,package/efl,embryo))
$(eval $(call AUTOTARGETS,package/efl,embryo,host))
