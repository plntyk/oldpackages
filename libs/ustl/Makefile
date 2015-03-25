#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ustl
PKG_VERSION:=2.2
PKG_RELEASE:=1

PKG_SOURCE:=v2.2.tar.gz
PKG_SOURCE_URL:=https://github.com/msharov/ustl/archive/
PKG_MD5SUM:=9123e904f55442cf79089e180bd93577
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/ustl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=C++ STL for embedded systems
  DEPENDS:=@BROKEN
  URL:=http://ustl.sourceforge.net/
endef

define Package/ustl/description
	C++ Standard Template Library (STL) for embedded systems.\\\
	uSTL is a partial implementation of the STL (Standard Template \\\
	Library) that reduces code size by factoring memory management \\\
	code into a non-template base class and deriving containers \\\
	from it.
	http://msharov.github.io/ustl/
endef

define Build/Configure
	$(CP) ./files/Config.mk $(PKG_BUILD_DIR)/
	$(CP) ./files/config.h $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CROSS="$(TARGET_CROSS)" \
		OPTFLAGS="$(TARGET_CFLAGS)" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all
endef

define Package/ustl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.o/libustl.so.* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/ustl
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/usr/include/ustl/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.o/libustl.{a,so*} $(1)/usr/lib/
endef

$(eval $(call BuildPackage,ustl))
