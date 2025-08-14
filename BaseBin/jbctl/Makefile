TARGET = jbctl

CC ?= clang

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -arch arm64 -arch arm64e -Wno-availability -miphoneos-version-min=15.0 -fobjc-arc
LDFLAGS = -L../.build -ljailbreak -lchoma

SDK_PATH := $(shell command -v xcrun >/dev/null 2>&1 && xcrun --sdk iphoneos --show-sdk-path)
ifeq ($(SDK_PATH),)
SDK_PATH := $(IOS_SDK_PATH)
endif
ifneq ($(SDK_PATH),)
CFLAGS += -isysroot $(SDK_PATH)
endif

sign: $(TARGET)
	@ldid -Sentitlements.plist $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)