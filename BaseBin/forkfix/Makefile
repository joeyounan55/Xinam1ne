TARGET = forkfix.dylib
CC ?= clang

CFLAGS = -I../.include -I./src -I../_external/modules/litehook/src -arch arm64e -Wno-deprecated-declarations -miphoneos-version-min=15.0 -O2
LDFLAGS = ../systemhook/systemhook.dylib -dynamiclib

SDK_PATH := $(shell command -v xcrun >/dev/null 2>&1 && xcrun --sdk iphoneos --show-sdk-path)
ifeq ($(SDK_PATH),)
SDK_PATH := $(IOS_SDK_PATH)
endif
ifneq ($(SDK_PATH),)
CFLAGS += -isysroot $(SDK_PATH)
endif

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.c src/*.S ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
