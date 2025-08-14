TARGET = launchdhook.dylib
CC = clang

SYSROOT := $(shell xcrun --sdk iphoneos --show-sdk-path 2>/dev/null)
ifeq ($(SYSROOT),)
ifndef SDKROOT
$(error SDKROOT is required)
endif
SYSROOT := $(SDKROOT)
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -Isrc -isysroot $(SYSROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -Wno-deprecated-declarations -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath @loader_path/fallback -L../.build -L../_external/lib -ljailbreak -lellekit -lbsm

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.m src/*.c src/jbserver/*.c ../systemhook/src/common.c ../systemhook/src/envbuf.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
