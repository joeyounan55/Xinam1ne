TARGET = libjailbreak.dylib

#ADDITIONAL_FLAGS = -O3

# for debugging
ADDITIONAL_FLAGS = -g

CC = clang

XCRUN := $(shell command -v xcrun 2>/dev/null)
ifneq ($(XCRUN),)
    SDK_PATH := $(shell xcrun --sdk iphoneos --show-sdk-path)
else
    SDK_PATH ?= $(SDKROOT)
endif

CFLAGS = -framework Foundation -framework CoreServices -framework Security -framework IOKit -framework IOSurface -I../.include -I../_external/modules/litehook/src -arch arm64 -arch arm64e -miphoneos-version-min=15.0 -fobjc-arc -dynamiclib -install_name @loader_path/$(TARGET) $(ADDITIONAL_FLAGS)
CFLAGS += -isysroot $(SDK_PATH)
LDFLAGS = -lbsm -L../.build -lchoma

ifneq ($(shell pkg-config --exists libarchive && echo yes 2>/dev/null),)
    CFLAGS += $(shell pkg-config --cflags libarchive)
    LDFLAGS += $(shell pkg-config --libs libarchive)
else ifneq ($(shell command -v brew 2>/dev/null),)
    CFLAGS += -I$(shell brew --prefix)/opt/libarchive/include
    LDFLAGS += -L$(shell brew --prefix)/opt/libarchive/lib -larchive
else
    CFLAGS += -I/usr/include
    LDFLAGS += -L/usr/lib -larchive
endif

sign: $(TARGET)
	@ldid -S $<

$(TARGET): $(wildcard src/*.c src/*.m src/*.S ../_external/modules/litehook/src/*.c)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	@rm -f $(TARGET)
