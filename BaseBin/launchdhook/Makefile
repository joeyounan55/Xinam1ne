TARGET = launchdhook.dylib
XCRUN_EXISTS := $(shell command -v xcrun >/dev/null 2>&1 && echo 1)
ifeq ($(XCRUN_EXISTS),1)
CC := $(shell xcrun --sdk iphoneos clang)
SDKROOT ?= $(shell xcrun --sdk iphoneos --show-sdk-path)
else
CC ?= clang
SDKROOT ?=
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -Isrc -isysroot $(SDKROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -Wno-deprecated-declarations -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath @loader_path/fallback -L../.build -L../_external/lib -ljailbreak -lellekit -lbsm

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.m src/*.c src/jbserver/*.c ../systemhook/src/common.c ../systemhook/src/envbuf.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
