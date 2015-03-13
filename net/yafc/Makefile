#
# Copyright (C) 2008-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yafc
PKG_VERSION:=1.3.5
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://www.yafc-ftp.com/upload/
PKG_MD5SUM:=34882bb4dbeee3a99587ff253648a66e

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/yafc
  SUBMENU:=File Transfer
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libncurses +libreadline +libopenssl +libssh
  TITLE:=Yafc is yet another ftp client.
  URL:=http://www.yafc-ftp.com/
endef

TARGET_CFLAGS += -std=gnu99

CONFIGURE_ARGS += \
	--with-socks=no \
	--with-socks5=no \
	--with-krb5=no \
	--without-bash-completion

CONFIGURE_VARS += \
	bash_cv_func_sigsetjmp=missing \
	ac_cv_ipv6=yes

define Package/yafc/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_BUILD_DIR)/yafc $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yafc))
