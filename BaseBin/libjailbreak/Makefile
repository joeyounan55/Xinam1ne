## SDK and Homebrew paths
# Set SDK_PATH and BREW_PREFIX manually if `xcrun` or `brew` are unavailable.
# Example:
#   make SDK_PATH=/path/to/iphoneos/sdk BREW_PREFIX=/path/to/homebrew

SDK_PATH ?= $(shell command -v xcrun >/dev/null 2>&1 && xcrun --sdk iphoneos --show-sdk-path || echo /path/to/sdk)
BREW_PREFIX ?= $(shell command -v brew >/dev/null 2>&1 && brew --prefix || echo /usr/local)

TARGET = libjailbreak.dylib

#ADDITIONAL_FLAGS = -O3

# for debugging
ADDITIONAL_FLAGS = -g

CC = clang

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -framework IOSurface -I../.include -I../_external/modules/litehook/src -isysroot $(SDK_PATH) -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -dynamiclib -install_name @loader_path/$(TARGET) -I$(BREW_PREFIX)/opt/libarchive/include $(ADDITIONAL_FLAGS)
LDFLAGS = -larchive -lbsm -L../.build -lchoma

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.c src/*.m src/*.S ../_external/modules/litehook/src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
