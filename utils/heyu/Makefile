#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=heyu
PKG_VERSION:=2.11git


PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_REVISION).tar.gz
PKG_SOURCE_URL:=https://github.com/HeyuX10Automation/heyu
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=194c2022d7cfe180177a3a8986ad5c1b187f8bd5
PKG_RELEASE:=$(PKG_SOURCE_VERSION)

PKG_LICENSE:=
PKG_LICENSE_FILES:=

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/heyu
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+setserial
  TITLE:=X10 home automation control using a CM11A
  URL:=http://heyu.tanj.com/heyu2/
endef

define Package/heyu/description
	HEYU is a text-based console program for remotely controlling lights
	and appliances in the home or office.   It is made available under a
	free and open source license.

	Heyu uses the CM11A computer interface to send and receive X10 control
	signals over the AC power lines to modules which can turn On, Off, or
	Dim attached lamps or appliances.   It can store a schedule of timed
	events in the CM11A memory for execution when the computer is turned
	off or disconnected.
endef

define Package/heyu/conffiles
/etc/heyu/x10.conf
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CFLAGS="$(TARGET_CFLAGS) \$$$$(DFLAGS)" \
	)
endef

define Package/heyu/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/heyu $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/$(PKG_NAME)
	$(INSTALL_DATA) ./files/x10.conf $(1)/etc/$(PKG_NAME)/x10.conf
endef

$(eval $(call BuildPackage,heyu))
