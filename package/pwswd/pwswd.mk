#############################################################
#
# pwswd
#
#############################################################
PWSWD_VERSION = master
PWSWD_SITE = git://github.com/Ayla-/pwswd.git
PWSWD_DEPENDENCIES = alsa-lib libpng

define PWSWD_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" STRIP="$(TARGET_CROSS)strip" INCLUDES="" -C $(@D) all
endef

define PWSWD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/pwswd $(TARGET_DIR)/usr/sbin/pwswd
	$(INSTALL) -D -m 0755 $(@D)/template.conf $(TARGET_DIR)/etc/pwswd.conf
endef

$(eval $(call GENTARGETS,package,pwswd))
