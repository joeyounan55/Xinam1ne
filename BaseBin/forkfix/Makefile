TARGET = forkfix.dylib
CC = $(TOOLCHAIN)
SDK_PATH ?= $(shell xcrun --sdk iphoneos --show-sdk-path)

CFLAGS = -I../.include -I./src -I../_external/modules/litehook/src --sysroot $(SDK_PATH) -arch arm64e -Wno-deprecated-declarations -miphoneos-version-min=15.0 -O2
LDFLAGS = ../systemhook/systemhook.dylib -dynamiclib

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c src/*.S ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
