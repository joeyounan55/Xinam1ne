TARGET = watchdoghook.dylib

include ../../common.mk

CFLAGS = -framework Foundation -framework CoreServices -framework Security -I../.include -I./src -isysroot $(SDKROOT) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -O2
LDFLAGS = -dynamiclib -rpath /var/jb/Library/Frameworks -rpath @loader_path/fallback -L../_external/lib -lellekit -framework IOKit

sign: $(TARGET)
	@ldid -S $^

$(TARGET): $(wildcard src/*.m src/*.c ../libjailbreak/src/jbclient_*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
