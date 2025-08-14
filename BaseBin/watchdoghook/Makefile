TARGET = watchdoghook.dylib
CC ?= clang

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath /var/jb/Library/Frameworks -rpath @loader_path/fallback -L../_external/lib -lellekit -framework IOKit

SDK_PATH := $(shell command -v xcrun >/dev/null 2>&1 && xcrun --sdk iphoneos --show-sdk-path)
ifeq ($(SDK_PATH),)
SDK_PATH := $(IOS_SDK_PATH)
endif
ifneq ($(SDK_PATH),)
CFLAGS += -isysroot $(SDK_PATH)
endif

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.m src/*.c ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
