TARGET = systemhook.dylib
CC = $(TOOLCHAIN)
SDK_PATH ?= $(shell xcrun --sdk iphoneos --show-sdk-path)

CFLAGS = -I../.include -I./src -I../_external/modules/litehook/src --sysroot $(SDK_PATH) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -install_name @loader_path/$(TARGET) -Wno-deprecated-declarations -Os -moutline
LDFLAGS = -dynamiclib

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c src/*.m ../libjailbreak/src/jbclient_*.c ../_external/modules/litehook/src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
