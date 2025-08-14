TARGET = systemhook.dylib
XCRUN_EXISTS := $(shell command -v xcrun >/dev/null 2>&1 && echo 1)
ifeq ($(XCRUN_EXISTS),1)
CC := $(shell xcrun --sdk iphoneos clang)
SDKROOT ?= $(shell xcrun --sdk iphoneos --show-sdk-path)
else
CC ?= clang
SDKROOT ?=
endif

CFLAGS = -I../.include -I./src -I../_external/modules/litehook/src -isysroot $(SDKROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -install_name @loader_path/$(TARGET) -Wno-deprecated-declarations -Os -moutline
LDFLAGS = -dynamiclib

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c src/*.m ../libjailbreak/src/jbclient_*.c ../_external/modules/litehook/src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
