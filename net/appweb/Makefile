#
# Copyright (C) 2009-2013 OpenWrt.org
# Copyright (C) 2009 Embedthis Software
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Commercial and other licenses are available from http://www.embedthis.com/.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=appweb
PKG_RELEASE:=1

#
#	Build stable
#
PKG_VERSION:=6.0.1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-src.tgz
PKG_SOURCE_URL:=https://embedthis.com/software/
PKG_MD5SUM:=dba12e963f66fde6d7081d5e1e4cbbfa
#https://embedthis.com/software/appweb-6.0.1-src.tgz

#
#	Build the latest snapshot from the default trunk
#
#PKG_VERSION:=default
#PKG_SOURCE:=tip.tar.gz
#PKG_SOURCE_URL:= http://hg.embedthis.com/appweb/archive/
#PKG_MD5SUM:=

include $(INCLUDE_DIR)/package.mk

# The files in the .tar.gz are
#    src/all/...
#    src/build/...
#    src/test/...
# and so on
#
# What we want is
#    $(PKG_BUILD_DIR)/all/...
#    $(PKG_BUILD_DIR)/build/...
#    $(PKG_BUILD_DIR)/test/...
# and so on
#
# The following two lines make this happen
#    1.  change tar option to strip out the top-level, src in
#        this case
#    2.  change the tar output to the build directory.  The
#        original tar command was
#        $(HOST_TAR) -C/.. $(1) $(TAR_OPTIONS)

TAR_OPTIONS:=--strip-components 1 $(TAR_OPTIONS)
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

define Package/appweb
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=Appweb Web Server
  URL:=http://www.appwebserver.org/
  DEPENDS:=@!avr32 +libpthread +libpcre +libsqlite3 +libopenssl @BROKEN
endef

define Package/appweb/description
 Appweb is a powerful, compact embedded web server designed for dynamic web
 applications.
endef

CONFIGURE_ARGS += \
	-q \
	--defaults=release \
	--shared \
	--tune=size \
	--without-php \
	--without-ssl \
	--disable-angel \
	--disable-samples \
	--disable-access-log \
	--disable-complete-native \
	--disable-complete-cross \
	--webdir=/www \
	--logdir=/var/log \
	--port=8000 \
	--sslPort=8443 \
	--config=flat

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		$(TARGET_CONFIGURE_OPTS) \
		BLD_CC_DYN_LOAD=1 \
		ME_COM_OPENSSL_PATH="$(STAGING_DIR)/usr/lib" \

endef

define Package/appweb/install
	( cd $(PKG_BUILD_DIR) ; $(MAKE) install ME_ROOT_PREFIX=$(PKG_BUILD_DIR)/ipkg-install )
	$(INSTALL_DIR) $(1)/etc/appweb
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/appweb/* $(1)/etc/appweb/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_CONF) $(PKG_INSTALL_DIR)/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/usr/local/lib/appweb/6.0.1/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/local/lib/appweb/6.0.1/bin/* $(1)/usr/local/lib/appweb/6.0.1/bin/
	$(INSTALL_DIR) $(1)/www/appweb
	$(INSTALL_DIR) $(1)/www/appweb/bench
	$(INSTALL_DIR) $(1)/www/appweb/icons
	$(INSTALL_DIR) $(1)/www/appweb/images
	$(INSTALL_DIR) $(1)/www/appweb/test
	$(CP) $(PKG_INSTALL_DIR)/var/www/appweb* $(1)/www/appweb/
	$(CP) $(PKG_INSTALL_DIR)/var/www/appweb/bench/* $(1)/www/appweb/bench/
	$(CP) $(PKG_INSTALL_DIR)/var/www/appweb/icons/* $(1)/www/appweb/icons/
	$(CP) $(PKG_INSTALL_DIR)/var/www/appweb/images/* $(1)/www/appweb/images/
	$(CP) $(PKG_INSTALL_DIR)/var/www/appweb/test/test.{cgi,ejs,esp,php,pl,py} $(1)/www/appweb/test/
	$(CP) $(PKG_INSTALL_DIR)/var/www/appweb/test/{bench,test}.html $(1)/www/appweb/test/
endef

$(eval $(call BuildPackage,appweb))
