# Requires Xcode's `xcrun` to be available or `SDKROOT` to be defined.
SDKROOT ?= $(shell xcrun --sdk iphoneos --show-sdk-path)
TARGET = forkfix.dylib
CC = clang

CFLAGS = -I../.include -I./src -I../_external/modules/litehook/src -isysroot $(SDKROOT) -arch arm64e -Wno-deprecated-declarations -miphoneos-version-min=15.0 -O2
LDFLAGS = ../systemhook/systemhook.dylib -dynamiclib

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c src/*.S ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
