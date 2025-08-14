TARGET = forkfix.dylib
CC = clang

SYSROOT := $(shell xcrun --sdk iphoneos --show-sdk-path 2>/dev/null)
ifeq ($(SYSROOT),)
ifndef SDKROOT
$(error SDKROOT is required)
endif
SYSROOT := $(SDKROOT)
endif

CFLAGS = -I../.include -I./src -I../_external/modules/litehook/src -isysroot $(SYSROOT) -arch arm64e -Wno-deprecated-declarations -miphoneos-version-min=15.0 -O2
LDFLAGS = ../systemhook/systemhook.dylib -dynamiclib

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c src/*.S ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
