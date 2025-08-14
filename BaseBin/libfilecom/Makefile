TARGET = libfilecom.dylib

CC = clang

SYSROOT := $(shell xcrun --sdk iphoneos --show-sdk-path 2>/dev/null)
ifeq ($(SYSROOT),)
ifndef SDKROOT
$(error SDKROOT is required)
endif
SYSROOT := $(SDKROOT)
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -I../_shared -I./src -isysroot $(SYSROOT) -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -Wno-nullability-completeness-on-arrays -dynamiclib -install_name /var/jb/basebin/$(TARGET) -O2

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)