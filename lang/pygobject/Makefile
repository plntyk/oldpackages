#
# Copyright (C) 2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pygobject
PKG_VERSION:=3.10.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@GNOME/$(PKG_NAME)/3.10
PKG_MD5SUM:=f311155be8510df6ad8e4edf1cb463d4
PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_CHECK_FORMAT_SECURITY:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk
$(call include_mk, python-package.mk)

EXTRA_LDFLAGS+= \
	-L$(ICONV_PREFIX) -L$(INTL_PREFIX)

TARGET_CFLAGS += $(FPIC) -D_GNU_SOURCE

CONFIGURE_VARS += \
	PYTHON=$(STAGING_DIR)/host/bin/python$(PYTHON_VERSION) \
	PYTHON_INCLUDES="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION)"

CONFIGURE_ARGS += \
	--enable-static \
	--disable-introspection \
	--with-libffi
	--with-python=$(STAGING_DIR)/usr/bin/python$(PYTHON_VERSION)

#BROKEN needs gobject-introspection
define Package/python-gobject
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=GLib bindings for python
  URL:=http://www.pygtk.org/
  DEPENDS:=+python3 +glib2 +libffi @BROKEN
endef

define Package/python-gobject/description
  GLib bindings for python
endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/pygtk-2.0/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/include/pygtk-2.0/* \
		$(1)/usr/include/pygtk-2.0/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/pkgconfig/* \
		$(1)/usr/lib/pkgconfig/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig/
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.{so,a,la} \
		$(1)/usr/lib/

	$(SED) \
		"s,^\(prefix\|exec_prefix\|datadir\)=,\1=$(STAGING_DIR),g" \
		$(1)/usr/lib/pkgconfig/pygobject-2.0.pc

	$(INSTALL_DIR) $(1)/usr/share/pygobject/2.0/codegen
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pygobject/2.0/codegen/*.py \
		$(1)/usr/share/pygobject/2.0/codegen

	$(INSTALL_DIR) $(1)/usr/share/pygobject/2.0/defs
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/share/pygobject/2.0/defs/* \
		$(1)/usr/share/pygobject/2.0/defs

	$(INSTALL_DIR) $(2)/bin
	$(INSTALL_BIN) \
		$(PKG_INSTALL_DIR)/usr/bin/* \
		$(2)/bin

	$(SED) \
		"s,^\(prefix\|datadir\)=,\1=$(STAGING_DIR),g" \
		$(2)/bin/pygobject-codegen-2.0
endef

define Package/python-gobject/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) \
		$(PKG_INSTALL_DIR)/usr/lib/*.so* \
		$(1)/usr/lib

	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)/usr/lib/python$(PYTHON_VERSION)/site-packages/*.{pth,py} \
		$(1)$(PYTHON_PKG_DIR)/

	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0
	$(INSTALL_DATA) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/*.py \
		$(1)$(PYTHON_PKG_DIR)/gtk-2.0/

	$(foreach d,gio, \
		$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)/gtk-2.0/$(d); \
		$(INSTALL_DATA) \
			$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/gtk-2.0/$(d)/*.{py,so} \
			$(1)$(PYTHON_PKG_DIR)/gtk-2.0/$(d); \
	)
endef

$(eval $(call BuildPackage,python-gobject))
