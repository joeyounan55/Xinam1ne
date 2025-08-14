TARGET = launchdhook.dylib
CC = $(TOOLCHAIN)
SDK_PATH ?= $(shell xcrun --sdk iphoneos --show-sdk-path)

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -Isrc --sysroot $(SDK_PATH) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -Wno-deprecated-declarations -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath @loader_path/fallback -L../.build -L../_external/lib -ljailbreak -lellekit -lbsm

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.m src/*.c src/jbserver/*.c ../systemhook/src/common.c ../systemhook/src/envbuf.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
