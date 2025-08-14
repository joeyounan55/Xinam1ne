SDK ?= iphoneos

XCRUN_EXISTS := $(shell command -v xcrun >/dev/null 2>&1 && echo yes || echo no)

ifeq ($(XCRUN_EXISTS),yes)
CC := xcrun -sdk $(SDK) clang
SDKROOT := $(shell xcrun --sdk $(SDK) --show-sdk-path)
else
CC := clang
SDKROOT :=
endif
