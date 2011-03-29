#############################################################
#
# yawn
#
#############################################################
YAWN_VERSION = master
YAWN_SITE = git://github.com/Ayla-/yawn.git

define YAWN_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define YAWN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/yawn $(TARGET_DIR)/usr/sbin/yawn
endef

$(eval $(call GENTARGETS,package,yawn))
