#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=flite
PKG_VERSION:=2.0.0-release
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.festvox.org/flite/packed/flite-2.0/
PKG_MD5SUM:=ae0aca1cb7b4801f4372f3a75a9e52b5

PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/flite
  SECTION:=sound
  CATEGORY:=Sound
  DEPENDS:=+alsa-lib
  TITLE:=Text-to-speech for embedded systems
  URL:=http://www.speech.cs.cmu.edu/flite/index.html
endef

define Package/flite/description
Festival Lite is a stripped down version of Festival,
	the well-developed text-to-speech program written in C++.
	This program is written in C to keep memory usage low.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) -v ./src/* $(PKG_BUILD_DIR)
endef

TARGET_LDFLAGS += -lm

CONFIGURE_ARGS+= \
		--enable-shared \
		--with-audio="oss" \
		--with-vox="cmu_us_kal16" \


#		--prefix="$(PKG_INSTALL_DIR)/usr" \
#		--exec-prefix="$(PKG_INSTALL_DIR)/usr" \
#		--bindir="$(PKG_INSTALL_DIR)/usr/bin" \


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/flite
	$(CP) $(PKG_INSTALL_DIR)/usr/include/flite/{cst,flite}*.h $(1)/usr/include/flite/
	$(INSTALL_DIR) $(1)/usr/lib
	ln -sf libflite_cmu_grapheme_lex.so.2.0.0 $(1)/usr/lib/libflite_cmu_grapheme_lex.so
	ln -sf libflite_cmu_indic_lang.so.2.0.0 $(1)/usr/lib/libflite_cmu_indic_lang.so
	ln -sf libflite_cmu_indic_lex.so.2.0.0 $(1)/usr/lib/libflite_cmu_indic_lex.so
	ln -sf libflite_cmulex.so.2.0.0 $(1)/usr/lib/libflite_cmulex.so
	ln -sf libflite_cmu_time_awb.so.2.0.0 $(1)/usr/lib/libflite_cmu_time_awb.so
	ln -sf libflite_cmu_us_awb.so.2.0.0 $(1)/usr/lib/libflite_cmu_us_awb.so
	ln -sf libflite_cmu_us_kal16.2.0.0 $(1)/usr/lib/libflite_cmu_us_kal16.so
	ln -sf libflite_cmu_us_kal.2.0.0 $(1)/usr/lib/libflite_cmu_us_kal.so
	ln -sf libflite_cmu_us_rms.so.2.0.0 $(1)/usr/lib/libflite_cmu_us_rms.so
	ln -sf libflite_cmu_us_slt.so.2.0.0 $(1)/usr/lib/libflite_cmu_us_slt.so
	ln -sf libflite_usenglish.so.2.0.0 $(1)/usr/lib/libflite_usenglish.so
	ln -sf libflite.so.2.0.0 $(1)/usr/lib/libflite.so	
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libflite*.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_BUILD_DIR)/flite.pc $(1)/usr/lib/pkgconfig/

endef

define Package/flite/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/flite $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libflite*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,flite))
