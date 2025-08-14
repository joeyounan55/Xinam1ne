# Requires Xcode's `xcrun` to be available or `SDKROOT` to be defined.
SDKROOT ?= $(shell xcrun --sdk iphoneos --show-sdk-path)
TARGET = libfilecom.dylib

CC = clang

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -I../_shared -I./src -isysroot $(SDKROOT) -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -Wno-nullability-completeness-on-arrays -dynamiclib -install_name /var/jb/basebin/$(TARGET) -O2

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)