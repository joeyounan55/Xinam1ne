TARGET = boomerang

CC = $(TOOLCHAIN)
SDK_PATH ?= $(shell xcrun --sdk iphoneos --show-sdk-path)

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src --sysroot $(SDK_PATH) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -Wno-nullability-completeness-on-arrays -O2
LDFLAGS = -L../.build -ljailbreak

sign: $(TARGET)
	@ldid -Sentitlements.plist $<

$(TARGET): $(wildcard src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
