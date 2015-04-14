#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cwiid
PKG_VERSION:=0.7-git
PKG_RELEASE:=1

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/mzimmerman/cwiid.git
PKG_SOURCE_VERSION:=1607bd75e61a60e14589200705c5e0f573223667
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz

PKG_FIXUP:=autoreconf
PKG_BUILD_DEPENDS:=python

include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)

define Package/cwiid/Default
  TITLE:=Linux Nintendo Wiimote interface
  URL:=http://abstrakraft.org/cwiid/
endef

define Package/libcwiid
$(call Package/cwiid/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE+= (library)
  DEPENDS:= +bluez-libs +libpthread +librt
endef

define Package/wminput
$(call Package/cwiid/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE+= (utility)
  DEPENDS:=+libcwiid
endef

define Package/python-cwiid
$(call Package/cwiid/Default)
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Python bindings for the cwiid libs
  DEPENDS:= +python +libcwiid
endef

CONFIGURE_ARGS += \
	--without-python \
	--enable-shared \
	--enable-static \
	--without-gtk

TARGET_CFLAGS += $(FPIC)
TARGET_CPPFLAGS += -I$(PKG_BUILD_DIR)/libcwiid/
TARGET_LDFLAGS += -lpthread -L$(PKG_BUILD_DIR)/libcwiid/ -Wl,-rpath-link=$(STAGING_DIR)/usr/lib

#define Build/Compile
#	$(MAKE) -C "$(PKG_BUILD_DIR)" \
#		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
#		CPPFLAGS="$(TARGET_CPPFLAGS)" \
#		LDFLAGS="$(TARGET_LDFLAGS) -L../libcwiid/" \
#		all
#	$(if $(Build/Compile/PyMod),,@echo Python packaging code not found.; false)
#	$(call Build/Compile/PyMod,./python/, \
#		install --prefix="$(PKG_INSTALL_DIR)/usr", \
#	)
#endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/libcwiid/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcwiid/libcwiid*.so* $(1)/usr/lib/
endef

define Package/libcwiid/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcwiid/libcwiid.so* $(1)/usr/lib/
endef

define Package/wminput/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/wminput/wminput $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/lswm/lswm $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libcwiid/libcwiid.so* $(1)/usr/lib/
endef

#define PyPackage/python-cwiid/filespec
#+|$(PYTHON_PKG_DIR)/cwiid.so
#endef

$(eval $(call BuildPackage,libcwiid))
$(eval $(call BuildPackage,wminput))
#$(eval $(call PyPackage,python-cwiid))
$(eval $(call BuildPackage,python-cwiid))
