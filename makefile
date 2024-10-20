RELEASE=snapshot
RELEASEFOLDER=$(RELEASE)
RELEASEDASH=#$(RELEASE)-

default: all

clean:
	rm -rf images builders dl

# zyxel: builders
# 	scripts/make-image $(RELEASEDASH)ramips-mt7621 zyxel zyxel_nwa50ax -wpad-basic-mbedtls

# ZyXEL LTE5398-M904
zyxel_lte5398-m904: builders
	scripts/make-image $(RELEASEDASH)ramips-mt7621 zyxel_lte5398-m904 zyxel_lte5398-m904 -extended_protocols

all: zyxel_lte5398-m904

builders: 

#builders/openwrt-imagebuilder-$(RELEASEDASH)ath79-generic.Linux-x86_64/bootstrap builders/openwrt-imagebuilder-$(RELEASEDASH)mvebu-cortexa9.Linux-x86_64/bootstrap builders/openwrt-imagebuilder-$(RELEASEDASH)ipq40xx-generic.Linux-x86_64/bootstrap builders/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64/bootstrap


# zyxel NWA50AX

# builders/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64/bootstrap: dl/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64.tar.xz
# 	mkdir -p builders
# 	tar x -C builders -vf $?
# 	touch $@

# dl/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64.tar.xz:
# 	mkdir -p dl
# 	wget -O $@ https://downloads.openwrt.org/$(RELEASEFOLDER)/targets/ramips/mt7621/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64.tar.xz

# zyxel NWA50AX
builders/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64/bootstrap: dl/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64.tar.zst
	mkdir -p builders
	tar x -C builders -vf $?
	touch $@

dl/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64.tar.xz:
	mkdir -p dl
	wget -O $@ https://downloads.openwrt.org/$(RELEASEFOLDER)/targets/ramips/mt7621/openwrt-imagebuilder-$(RELEASEDASH)ramips-mt7621.Linux-x86_64.tar.zst

#              https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.zst