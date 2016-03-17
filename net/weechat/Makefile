#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=weechat
PKG_VERSION:=1.4
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.weechat.org/files/src
PKG_MD5SUM:=24e23908fc6fb4b55b86ead2c03aa8b3

#PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(INCLUDE_DIR)/nls.mk

define Package/weechat
  SUBMENU:=Instant Messaging
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Lightweight IRC client
  URL:=http://www.weechat.org/
  DEPENDS:=+libcurl +libgnutls +libgcrypt +zlib +libncursesw $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/weechat/description
 Weechat is fast, light & extensible IRC client.
endef

CMAKE_OPTIONS+= \
	-DENABLE_PYTHON=OFF \
	-DENABLE_PERL=OFF \
	-DENABLE_LUA=OFF \
	-DENABLE_GUILE=OFF \
	-DENABLE_RUBY=OFF \
	-DENABLE_TCL=OFF \
	$(if $(CONFIG_BUILD_NLS),-DENABLE_NLS:BOOL=ON,-DENABLE_NLS:BOOL=OFF) \
	-DLIBINTL_INCLUDE:PATH="$(INTL_PREFIX)/include" \
	$(if $(CONFIG_BUILD_NLS),-DLIBINTL_LIBRARY:PATH="$(INTL_PREFIX)/lib/libintl.so",) \
	-DICONV_INCLUDE_PATH:PATH="$(ICONV_PREFIX)/include" \
	$(if $(CONFIG_BUILD_NLS),-DICONV_LIBRARY:FILEPATH="$(ICONV_PREFIX)/lib/libiconv.so",-DICONV_LIBRARY:FILEPATH="$(ICONV_PREFIX)/lib/libiconv.a")

# -DICONV_LIBRARY:FILEPATH="$(ICONV_PREFIX)/lib/libiconv.so

define Package/weechat/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/weechat $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/weechat/plugins
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/weechat/plugins/* \
		$(1)/usr/lib/weechat/plugins/
endef

$(eval $(call BuildPackage,weechat))
