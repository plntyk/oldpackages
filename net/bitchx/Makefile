#
# Copyright (C) 2006-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bitchx
PKG_VERSION:=1.2.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/bitchx
PKG_MD5SUM:=4da13a2dcfa17847168e50e62be4f67a

PKG_INSTALL:=1
PKG_MACRO_PATHS:=macros
PKG_FIXUP:=autoreconf
PKG_BUILD_DEPENDS:=libncurses

include $(INCLUDE_DIR)/package.mk

define Package/bitchx
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses
  TITLE:=popular IRC client
  URL:=http://www.bitchx.org
endef

define Package/bitchx/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib $(1)/etc/init.d
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,bitchx))
