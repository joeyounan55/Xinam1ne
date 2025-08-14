TARGET = libfilecom.dylib

CC ?= clang

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -I../_shared -I./src -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -Wno-nullability-completeness-on-arrays -dynamiclib -install_name /var/jb/basebin/$(TARGET) -O2

SDK_PATH := $(shell command -v xcrun >/dev/null 2>&1 && xcrun --sdk iphoneos --show-sdk-path)
ifeq ($(SDK_PATH),)
SDK_PATH := $(IOS_SDK_PATH)
endif
ifneq ($(SDK_PATH),)
CFLAGS += -isysroot $(SDK_PATH)
endif

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)