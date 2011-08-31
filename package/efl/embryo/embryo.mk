################################################################################
#
# embryo -- EFL EMBRYO library
#
################################################################################

EMBRYO_VERSION = 1.2.0
EMBRYO_SOURCE = embryo-$(EMBRYO_VERSION).tar.bz2
EMBRYO_SITE = http://download.enlightenment.org/releases/
EMBRYO_AUTORECONF = NO
EMBRYO_INSTALL_STAGING = YES
EMBRYO_INSTALL_TARGET = YES
EMBRYO_DEPENDENCIES = host-pkg-config eina

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
