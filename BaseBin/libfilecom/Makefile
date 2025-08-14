TARGET = libfilecom.dylib

CC = $(TOOLCHAIN)
SDK_PATH ?= $(shell xcrun --sdk iphoneos --show-sdk-path)

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -I../_shared -I./src --sysroot $(SDK_PATH) -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -Wno-nullability-completeness-on-arrays -dynamiclib -install_name /var/jb/basebin/$(TARGET) -O2

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.m)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)