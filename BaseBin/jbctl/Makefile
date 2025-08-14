TARGET = jbctl
XCRUN_EXISTS := $(shell command -v xcrun >/dev/null 2>&1 && echo 1)
ifeq ($(XCRUN_EXISTS),1)
CC := $(shell xcrun --sdk iphoneos clang)
SDKROOT ?= $(shell xcrun --sdk iphoneos --show-sdk-path)
else
CC ?= clang
SDKROOT ?=
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -isysroot $(SDKROOT) -arch arm64 -arch arm64e -Wno-availability -miphoneos-version-min=15.0 -fobjc-arc
LDFLAGS = -L../.build -ljailbreak -lchoma

sign: $(TARGET)
	@ldid -Sentitlements.plist $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
        @rm -f $(TARGET)
