TARGET = jbctl

CC = $(TOOLCHAIN)
SDK_PATH ?= $(shell xcrun --sdk iphoneos --show-sdk-path)

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src --sysroot $(SDK_PATH) -arch arm64 -arch arm64e -Wno-availability -miphoneos-version-min=15.0 -fobjc-arc
LDFLAGS = -L../.build -ljailbreak -lchoma

sign: $(TARGET)
	@ldid -Sentitlements.plist $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)