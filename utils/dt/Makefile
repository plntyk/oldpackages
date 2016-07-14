#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dt
PKG_VERSION:=18.32
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-source-v18.32.tar.gz
PKG_SOURCE_URL:=http://pkgs.fedoraproject.org/lookaside/pkgs/dt/dt-source-v18.32.tar.gz/3054aeaaba047a1dbe90c2132a382ee2
PKG_MD5SUM:=5776233a2d301a50b314306538257a45

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK= \
	zcat $(DL_DIR)/$(PKG_SOURCE) | \
		$(TAR) -C $(PKG_BUILD_DIR) --strip-components 2 $(TAR_OPTIONS);

define Package/dt
  CATEGORY:=Utilities
  SECTION:=utils
  TITLE:=A generic data test program
  URL:=http://www.scsifaq.org/RMiller_Tools/index.html
  DEPENDS:=+libpthread +librt @!USE_MUSL @!USE_UCLIBC
endef

define Package/dt/description
 dt is a generic data test program used to verify proper operation of peripherals,
 file systems, device drivers, or any data stream supported by the operating system.
 In its' simplest mode of operation, dt writes and then verifys its' default data pattern,
 then displays performance statisics and other test parameters before exiting.
 Since verification of data is performed, dt can be thought of as a generic diagnostic tool.
endef

define Build/Compile
	$(cd $(PKG_BUILD_DIR); cp scsilib-linux.c scsilib.c)
	$(MAKE) -C $(PKG_BUILD_DIR) -f Makefile.linux \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -DAIO -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DTHREADS" \
		VPATH=.. OS=linux \
		dt
endef

define Package/dt/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dt $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dt))
