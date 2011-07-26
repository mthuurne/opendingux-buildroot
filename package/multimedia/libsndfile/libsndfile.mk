#############################################################
#
# libsndfile
#
#############################################################
LIBSNDFILE_VERSION:=1.0.18
LIBSNDFILE_SOURCE:=libsndfile-$(LIBSNDFILE_VERSION).tar.gz
LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile
LIBSNDFILE_LIBTOOL_PATCH:=NO
LIBSNDFILE_INSTALL_STAGING:=YES

# We have no cross pkg-config and using the host version can cause problems.
LIBSNDFILE_CONF_ENV:=PKG_CONFIG=/do-not-use-pkg-config

$(eval $(call AUTOTARGETS,package/multimedia,libsndfile))
