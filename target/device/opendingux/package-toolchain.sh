#!/bin/sh
#
# Create a tarball of the toolchain.
#
# This script requires the following override to be applied to the config:
#   BR2_STAGING_DIR="/opt/opendingux-toolchain"
# And that directory to be writable by the user doing the build.

tar -C/opt --exclude='.fakeroot.*' -jcf opendingux-toolchain.`date +'%Y-%m-%d'`.tar.bz2 opendingux-toolchain
