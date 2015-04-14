#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hplip
PKG_VERSION:=3.15.11
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/hplip
PKG_MD5SUM:=a2d8134ab15a1d67d4c3b3c11f85ba1c

PKG_BUILD_DEPENDS:=python
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/hplip
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=HP Linux Imaging and Printing
  URL:=http://sourceforge.net/projects/hplip/
  DEPENDS+=+libjpeg +libtiff +libusb-compat +cups +sane-libs +libpng
endef

define Package/hplip/description
	HPLIP is an HP developed solution for printing, scanning, and faxing with HP inkjet and laser based printers in Linux.
endef

CONFIGURE_VARS += \
	ac_cv_lib_cups_cupsDoFileRequest=yes \
	LIBS="-lz -ljpeg -lusb -lcups -lpng -ltiff"

CONFIGURE_ARGS += \
	--enable-cups-ppd-install \
	--enable-cups-drv-install \
	--enable-hpcups-install \
	--enable-lite-build \
	--disable-new-hpcups \
	--disable-dbus-build \
	--disable-doc-build \
	--disable-fax-build \
	--disable-foomatic-ppd-install \
	--disable-foomatic-drv-install \
	--disable-foomatic-rip-hplip-install \
	--disable-gui-build \
	--disable-hpijs-install \
	--disable-network-build \
	--disable-qt4 \
	--disable-scan-build


define Package/hplip/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/.libs/libhpip.so* $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/.libs/libhpmud.so* $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/cups/backend
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/.libs/hp $(1)/usr/lib/cups/backend

# Not build with lite-build
#	$(INSTALL_DIR) $(1)/usr/lib/sane
#	$(CP) $(PKG_BUILD_DIR)/.libs/libsane-hpaio.so* $(1)/usr/lib/sane

	$(INSTALL_DIR) $(1)/etc/hp
	$(CP) $(PKG_BUILD_DIR)/hplip.conf $(1)/etc/hp/hplip.conf

	$(INSTALL_DIR) $(1)/usr/share/hplip/data/models/
	$(CP) $(PKG_BUILD_DIR)/data/models/models.dat $(1)/usr/share/hplip/data/models/

	$(INSTALL_DIR) $(1)/etc/hotplug.d/usb/
	$(INSTALL_BIN) ./files/20-hplip $(1)/etc/hotplug.d/usb/

	$(INSTALL_DIR) $(1)/etc/sane.d/dll.d/
	$(INSTALL_DATA) ./files/hplib.conf $(1)/etc/sane.d/dll.d/hplib
endef

define Package/hplip/conffiles
/etc/hp/hplip.conf
endef

$(eval $(call BuildPackage,hplip))
