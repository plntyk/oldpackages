#
# Copyright (C) 2007-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=streamripper
PKG_VERSION:=1.64.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=a37a1a8b8f9228522196a122a1c2dd32

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

#from glib2
include $(INCLUDE_DIR)/nls.mk

define Package/streamripper
  SECTION:=multimedia
  CATEGORY:=Multimedia
  DEPENDS:=+libmad +libfaad2 +libpthread +glib2
  TITLE:=streamripper
  URL:=http://streamripper.sourceforge.net/
endef

define Package/streamripper/description
	Streamripper is an Open Source application that lets you record streaming mp3 to your hard drive.
endef


EXTRA_CFLAGS += $(TARGET_CPPFLAGS)

CONFIGURE_ARGS+= \
	--without-ogg \
	--with-included-argv \
	--without-included-libmad \
	--without-libiconv-prefix \
	--with-included-tre \
	--with-gnu-ld \
	--disable-oggtest \
	--disable-vorbistest

define Package/streamripper/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/streamripper $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
endef

$(eval $(call BuildPackage,streamripper))
