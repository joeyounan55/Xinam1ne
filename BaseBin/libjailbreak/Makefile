TARGET = libjailbreak.dylib

#ADDITIONAL_FLAGS = -O3

# for debugging
ADDITIONAL_FLAGS = -g

CC ?= clang

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -framework IOSurface -I../.include -I../_external/modules/litehook/src -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -dynamiclib -install_name @loader_path/$(TARGET) -I$(shell brew --prefix)/opt/libarchive/include $(ADDITIONAL_FLAGS)
LDFLAGS = -larchive -lbsm -L../.build -lchoma

SDK_PATH := $(shell command -v xcrun >/dev/null 2>&1 && xcrun --sdk iphoneos --show-sdk-path)
ifeq ($(SDK_PATH),)
SDK_PATH := $(IOS_SDK_PATH)
endif
ifneq ($(SDK_PATH),)
CFLAGS += -isysroot $(SDK_PATH)
endif

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.c src/*.m src/*.S ../_external/modules/litehook/src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
