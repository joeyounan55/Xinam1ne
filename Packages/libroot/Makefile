TARGET = libroot.dylib
XCRUN_EXISTS := $(shell command -v xcrun >/dev/null 2>&1 && echo 1)
ifeq ($(XCRUN_EXISTS),1)
CC := $(shell xcrun --sdk iphoneos clang)
SDKROOT ?= $(shell xcrun --sdk iphoneos --show-sdk-path)
else
CC ?= clang
SDKROOT ?=
endif

CFLAGS = -I../../BaseBin/.include -Isrc -isysroot $(SDKROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath /var/jb

all: $(TARGET) sign

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c ../../BaseBin/libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
	@rm -f libroot.deb

package: all
	@mkdir -p .package/DEBIAN
	@mkdir -p .package/var/jb/usr/lib
	@cp control .package/DEBIAN/control
	@cp libroot.dylib .package/var/jb/usr/lib/libroot.dylib
	@dpkg-deb --root-owner-group -Zzstd -b .package ./libroot.deb
	@rm -rf .package