# Determine a usable compiler
XCRUN := $(shell command -v xcrun 2>/dev/null)

ifeq ($(XCRUN),)
    # "xcrun" not available; keep existing CC if it resolves to a compiler
    ifeq ($(shell command -v $(CC) 2>/dev/null),)
        CC := $(shell command -v clang 2>/dev/null)
    endif
    ifeq ($(CC),)
        $(warning Neither xcrun nor a usable compiler was found.\nInstall Xcode command line tools or set the CC environment variable.)
    endif
else
    CC := $(shell xcrun --find clang)
endif

export CC

all:
	@./BaseBin/pack.sh
	@xattr -rc Tools >/dev/null 2>&1
	$(MAKE) -C Exploits/oobPCI
	$(MAKE) -C Dopamine

%:
	@echo "No target rule for $@"

clean:
	@./BaseBin/clean.sh

update: all
	@./jbupdate.sh
