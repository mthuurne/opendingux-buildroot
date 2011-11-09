
ELEMENTARY_VERSION = 0.7.0.55225
ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.gz
ELEMENTARY_SITE = http://download.enlightenment.org/snapshots/2010-12-03/
ELEMENTARY_INSTALL_STAGING = YES
ELEMENTARY_INSTALL_TARGET = YES
ELEMENTARY_DEPENDENCIES = host-edje edje

ELEMENTARY_CONF_OPT = --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
					  --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
					  --disable-elementary-test \
					  --disable-elementary-config \
					  --disable-doc

$(eval $(call AUTOTARGETS,package/efl,elementary))
$(eval $(call AUTOTARGETS,package/efl,elementary,host))
