TARGET = libjailbreak.dylib

#ADDITIONAL_FLAGS = -O3

# for debugging
ADDITIONAL_FLAGS = -g

CC = clang

# detect libarchive prefix via brew if available, allow override
BREW_PREFIX := $(shell command -v brew >/dev/null 2>&1 && brew --prefix)
LIBARCHIVE_PREFIX ?= $(if $(BREW_PREFIX),$(BREW_PREFIX)/opt/libarchive)

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -framework IOSurface -I../.include -I../_external/modules/litehook/src -isysroot $(shell xcrun --sdk iphoneos --show-sdk-path) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -dynamiclib -install_name @loader_path/$(TARGET) $(ADDITIONAL_FLAGS)

ifneq ($(LIBARCHIVE_PREFIX),)
CFLAGS += -I$(LIBARCHIVE_PREFIX)/include
endif

LDFLAGS = -larchive -lbsm -L../.build -lchoma

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.c src/*.m src/*.S ../_external/modules/litehook/src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
