#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=leptonica
PKG_VERSION:=1.71
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.leptonica.com/source/
PKG_MD5SUM:=790f34d682e6150c12c54bfe4a824f7f

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libleptonica
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A library for efficient image processing and image analysis operations
  URL:=http://www.leptonica.com/
  DEPENDS:=+giflib +libjpeg +libpng +libtiff +zlib
endef

TARGET_CFLAGS += $(FPIC)
TARGET_LDFLAGS += -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/leptonica $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblept.{a,so*} $(1)/usr/lib/
endef

define Package/libleptonica/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblept.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libleptonica))

