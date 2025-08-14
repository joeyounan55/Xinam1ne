TARGET = jbctl

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

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -isysroot $(SYSROOT) -arch arm64 -arch arm64e -Wno-availability -miphoneos-version-min=15.0 -fobjc-arc
LDFLAGS = -L../.build -ljailbreak -lchoma

sign: $(TARGET)
	@ldid -Sentitlements.plist $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
