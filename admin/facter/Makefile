#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=facter
PKG_VERSION:=3.1.8
PKG_RELEASE:=1

PKG_SOURCE:=${PKG_NAME}-${PKG_VERSION}.tar.gz
PKG_SOURCE_URL:=http://downloads.puppetlabs.com/facter/
PKG_MD5SUM:=8e0789eb1d452388fdba9c2e46df9d54

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk
include $(INCLUDE_DIR)/nls.mk

define Package/facter
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS:=+yaml-cpp +leatherman +boost-program_options +libblkid +libopenssl
  TITLE:=Collect and display facts about the system
  URL:=http://projects.puppetlabs.com/projects/facter
endef

define Package/facter/description
 A cross-platform Ruby library for retrieving facts from operating systems.
 Supports multiple resolution mechanisms, any of which can be restricted to
 working only on certain operating systems or environments. Facter is
 especially useful for retrieving things like operating system names, IP
 addresses, MAC addresses, and SSH keys.

 It is easy to extend Facter to include your own custom facts or to include
 additional mechanisms for retrieving facts.
endef


define Package/facter/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,facter))
