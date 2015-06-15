#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=matrixssl
PKG_VERSION:=3-7-2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-open.tgz
PKG_SOURCE_URL:=http://nbd.vd-s.ath.cx/openwrt
PKG_MD5SUM:=2ed37e14b181bbc58e42d08ad05858fe

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)-open
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libmatrixssl
  SECTION:=libs
  SUBMENU:=SSL
  CATEGORY:=Libraries
  DEPENDS:=+libpthread @!USE_MUSL @BROKEN
  TITLE:=Embedded SSL implementation
  URL:=http://www.matrixssl.org/
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC) -Wall -ffunction-sections -fdata-sections -fomit-frame-pointer

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(PKG_BUILD_DIR) -I$(STAGING_DIR)/usr/include" \
		CROSS=$(TARGET_CROSS) \
		CCARCH="LINUX" \
		OSDEP="POSIX"
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/matrixssl/matrixsslApi.h $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/core/libcore_s.a $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/crypto/libcrypt_s.a $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/matrixssl/libssl_s.a $(1)/usr/lib/
endef

define Package/libmatrixssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/libmatrixssl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libmatrixssl))
