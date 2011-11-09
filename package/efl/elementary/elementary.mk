
ELEMENTARY_VERSION = 1.0.0
ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.bz2
ELEMENTARY_SITE = http://download.enlightenment.org/releases/
ELEMENTARY_INSTALL_STAGING = YES
ELEMENTARY_INSTALL_TARGET = YES
ELEMENTARY_DEPENDENCIES = host-edje edje

ELEMENTARY_CONF_OPT = --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
					  --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
					  --disable-elementary-test \
					  --disable-elementary-config \
					  --disable-doc

$(eval $(call AUTOTARGETS))
$(eval $(call AUTOTARGETS,host))
