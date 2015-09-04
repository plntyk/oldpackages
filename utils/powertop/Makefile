#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=powertop
PKG_VERSION:=2.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://01.org/sites/default/files/downloads/powertop/
PKG_MD5SUM:=e0d686e47daaf7e9d89031f7763432ef

PKG_FIXUP:=gettext-version autoreconf
PKG_INSTALL:=1
INTL_FULL:=1

include $(INCLUDE_DIR)/package.mk
#include $(INCLUDE_DIR)/nls.mk

define Package/powertop
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=PowerTOP
  DEPENDS:=+libncursesw +libstdcpp +libnl
# $(ICONV_DEPENDS) $(INTL_DEPENDS)
  URL:=http://www.lesswatts.org
endef

define Package/powertop/description
 PowerTOP is a Linux tool that helps you find those programs that are
 misbehaving while your computer is idle.
endef

#LIBS+=-lintl

CONFIGURE_ARGS += \
	--disable-silent-rules
#	--with-libiconv-prefix=$(ICONV_PREFIX) \
#	--with-libintl-prefix=$(INTL_PREFIX)


define Package/powertop/install
	$(CP) $(PKG_INSTALL_DIR)/* $(1)
endef

$(eval $(call BuildPackage,powertop))
