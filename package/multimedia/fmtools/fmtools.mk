#############################################################
#
# fmctools
#
#############################################################
FMTOOLS_VERSION = 2.0.1
FMTOOLS_SOURCE = fmtools-$(FMTOOLS_VERSION).tar.gz
FMTOOLS_SITE = http://benpfaff.org/fmtools

$(eval $(call AUTOTARGETS,package/multimedia,fmtools))
