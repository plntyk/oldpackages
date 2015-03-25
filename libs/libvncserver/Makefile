#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=LibVNCServer
PKG_VERSION:=0.9.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/LibVNC/libvncserver/archive/
PKG_MD5SUM:=e1b888fae717b06896f8aec100163d27

PKG_BUILD_DIR:=$(BUILD_DIR)/libvncserver-$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

# newer versions provide cmake but it seems to be buggy
# missing symbol b64_ntop in linking phase
#include $(INCLUDE_DIR)/cmake.mk

define Package/libvncserver
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+zlib +libjpeg +libpng +libpthread $(ICONV_DEPENDS)
  TITLE:=VNC Server Library
  URL:=http://libvncserver.sourceforge.net/
endef

CONFIGURE_ARGS += \
	--with-sdl=no \
	--without-avahi \
	--without-dpms \
	--without-fbpm \
	--without-filetransfer \
	--without-gcrypt \
	--without-libva \
	--without-macosx-native \
	--without-ssl \
	--without-xdamage \
	--without-xfixes \
	--without-xkeyboard \
	--without-xinerama \
	--without-xrandr \
	--without-xrecord \
	--without-xtrap

#define Build/InstallDev
#	$(INSTALL_DIR) $(1)/usr/{lib,include,bin}
#	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
#	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib* $(1)/usr/lib
#	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
#endef

define Package/libvncserver/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lib*so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libvncserver))
