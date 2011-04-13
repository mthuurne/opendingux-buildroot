#############################################################
#
# gmenu2x
#
#############################################################
GMENU2X_VERSION = install_locations
GMENU2X_SITE = git://projects.qi-hardware.com/gmenu2x.git
GMENU2X_DEPENDENCIES = sdl sdl_image sdl_gfx
GMENU2X_AUTORECONF = YES
GMENU2X_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr

$(eval $(call AUTOTARGETS,package,gmenu2x))
