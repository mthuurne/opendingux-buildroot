#############################################################
#
# htop
#
#############################################################
HTOP_VERSION:=0.9
HTOP_SOURCE:=htop-$(HTOP_VERSION).tar.gz
HTOP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/htop
HTOP_DEPENDENCIES:=ncurses

$(eval $(call AUTOTARGETS,package,htop))
