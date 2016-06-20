#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dash
PKG_VERSION:=0.5.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://gondor.apana.org.au/~herbert/dash/files
PKG_MD5SUM:=57341c24c3ebd3d5fc3a863001c94be6

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dash
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Debian Almquist shell
  URL:=http://gondor.apana.org.au/~herbert/dash/
endef

define Package/dash/description
 A small footprint, POSIX complied unix shell
endef

MAKE_FLAGS += \
	AWK="awk"

define Package/dash/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/dash $(1)/bin/
endef

$(eval $(call BuildPackage,dash))
