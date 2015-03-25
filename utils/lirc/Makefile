#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lirc
PKG_VERSION:=0.9.2a
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/${PKG_NAME}
PKG_MD5SUM:=639a14ed0b3b34ae227a047b952ea368

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lirc/Default
    SECTION:=utils
    CATEGORY:=Utilities
    URL:=http://lirc.org/
endef

define Package/lirc
    $(call Package/lirc/Default)
    TITLE:=LIRC - Linux Infrared Remote Control
    MENU:=1
    DEPENDS:=+libpthread +libftdi +libusb-compat
endef

define Package/lirc/description
 LIRC is a package that allows you to decode and send infra-red signals of many
 (but not all) commonly used remote controls.
endef

define Package/lircdaemonadd
    $(call Package/lirc/Default)
    DEPENDS:=lirc
    TITLE:=daemon additional files
endef

define Package/lircdaemonadd/description
 Contains additional daemon-tools.
endef

define  Package/lirctools
    $(call Package/lirc/Default)
    DEPENDS:=lirc
    TITLE:=LIRC tools
endef

define Package/lirctools/description
 Contains additional lirc-tools.
endef

CONFIGURE_ARGS += \
	--with-gnu-ld \
	--with-pic \
	--without-x \
	--disable-nls \
	--disable-static

define Package/lirc/conffiles
/etc/lirc/lircd.conf
endef

define Package/lircdaemonadd/conffiles
/etc/lirc/lircmd.conf
endef

define Package/lirc/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lircd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/lirc/
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/lirc/lircd.conf $(1)/etc/lirc/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/liblirc.so.0 $(1)/usr/lib/
endef

define Package/lircdaemonadd/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lircmd $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/lirc/	
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/lirc/lircmd.conf $(1)/etc/lirc/
endef

define Package/lirctools/install
	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/lirc-lsplugins $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lirc-lsremotes $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/irrecord $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/irsend $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/irw $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mode2 $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/lib/liblirc_client.so.0 $(1)/usr/lib/
endef

$(eval $(call BuildPackage,lirc))
$(eval $(call BuildPackage,lircdaemonadd))
$(eval $(call BuildPackage,lirctools))
