#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bluez-hcidump
PKG_VERSION:=2.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://www.kernel.org/pub/linux/bluetooth
PKG_MD5SUM:=ec3442b08f19a1ad9fdfbb72912c4e80

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/bluez-hcidump
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+bluez-libs
  TITLE:=Bluetooth packet analyzer
  URL:=http://www.bluez.org/
endef

define Package/bluez-hcidump/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/hcidump $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,bluez-hcidump))
