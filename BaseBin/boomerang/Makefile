TARGET = boomerang

CC = clang

SYSROOT := $(shell xcrun --sdk iphoneos --show-sdk-path 2>/dev/null)
ifeq ($(SYSROOT),)
ifndef SDKROOT
$(error SDKROOT is required)
endif
SYSROOT := $(SDKROOT)
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -isysroot $(SYSROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -Wno-nullability-completeness-on-arrays -O2
LDFLAGS = -L../.build -ljailbreak

sign: $(TARGET)
	@ldid -Sentitlements.plist $<

$(TARGET): $(wildcard src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
