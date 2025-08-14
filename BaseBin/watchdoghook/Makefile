TARGET = watchdoghook.dylib
CC = clang

ifeq ($(SYSROOT),)
SYSROOT := $(shell xcrun --sdk iphoneos --show-sdk-path 2>/dev/null)
ifeq ($(SYSROOT),)
ifndef SDKROOT
$(error SDKROOT is required)
endif
SYSROOT := $(SDKROOT)
endif
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -isysroot $(SYSROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath /var/jb/Library/Frameworks -rpath @loader_path/fallback -L../_external/lib -lellekit -framework IOKit

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.m src/*.c ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
