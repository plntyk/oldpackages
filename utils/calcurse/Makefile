include $(TOPDIR)/rules.mk

PKG_NAME:=calcurse
PKG_VERSION:=4.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://calcurse.org/files
PKG_MD5SUM:=3cd414a30e6e1d118ae340bc7cb1a93a

include $(INCLUDE_DIR)/package.mk

define Package/calcurse
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Calcurse
  DEPENDS:=+libncursesw +libreadline +libpthread
  URL:=http://culot.org/calcurse
endef

define Package/calcurse/description
	Fullscreen curses based calendar.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr \
	)
endef

define Package/calcurse/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/calcurse $(1)/usr/bin/
endef

$(eval $(call BuildPackage,calcurse))
