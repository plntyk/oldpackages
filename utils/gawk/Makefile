#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gawk
PKG_VERSION:=4.1.1
PKG_RELEASE:=1

PKG_SOURCE:=gawk-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://ftp.gnu.org/gnu/gawk/
PKG_MD5SUM:=45f5b09aa87b4744c4c53bf274e96ed0


include $(INCLUDE_DIR)/package.mk

define Package/gawk
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=GAWK
	URL:=http://www.gnu.org/software/gawk/
endef

define Package/gawk/description
	GNU version of AWK.
endef

define Build/Configure
	$(call Build/Configure/Default, \
		--prefix=/usr --with-linux-headers="$(LINUX_DIR)" \
	)
endef

define Package/gawk/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gawk $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/awklib/igawk $(1)/usr/bin/
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pgawk $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/libexec/
	$(INSTALL_DIR) $(1)/usr/libexec/awk/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/awklib/grcat $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/awklib/pwcat $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/share/
	$(INSTALL_DIR) $(1)/usr/share/awk/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/awklib/eg/lib/* $(1)/usr/share/awk
endef

$(eval $(call BuildPackage,gawk))
