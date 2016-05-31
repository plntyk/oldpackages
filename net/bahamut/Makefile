#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bahamut
PKG_VERSION:=2.0.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://code.dal.net/release/
PKG_MD5SUM:=b6e63e6cdae6cca9145a4d2111747e7c

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/bahamut
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libopenssl +zlib
  SUBMENU:=Instant Messaging
  TITLE:=Bahamut IRC server
  URL:=http://bahamut.dal.net
endef

TARGET_CFLAGS += \
	-D_GNU_SOURCE \
	-DSYS_ERRLIST_DECLARED \
	-fgnu89-inline

CONFIGURE_VARS+= \
		ac_cv_func_dn_skipname=yes \
		ZLIB_HOME="$(STAGING_DIR)/usr"

CONFIGURE_ARGS+= \
		--with-maxconnections=64 \
		--enable-openssl="$(STAGING_DIR)/usr/lib"

define Build/Compile
	$(call Build/Compile/Default,\
		prefix="$(PKG_INSTALL_DIR)/usr" \
		INSTALL_DIR="$(PKG_INSTALL_DIR)" \
		STAGING_DIR="$(STAGING_DIR)" \
		all \
	)
endef

define Package/bahamut/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ircd $(1)/usr/sbin
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/doc/*.{txt,conf} $(1)/etc/$(PKG_NAME)
endef

$(eval $(call BuildPackage,bahamut))
