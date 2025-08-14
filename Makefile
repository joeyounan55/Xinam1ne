XCRUN := \
       $(shell command -v xcrun 2>/dev/null)

ifndef XCRUN
ifndef USE_SYSTEM_TOOLS
$(error xcrun not found. Install Xcode command line tools or run 'make USE_SYSTEM_TOOLS=1' to use system clang.)
endif
endif

export USE_SYSTEM_TOOLS

all:
        @./BaseBin/pack.sh
        @xattr -rc Tools >/dev/null 2>&1
        $(MAKE) -C Exploits/oobPCI
ifeq ($(XCRUN),)
        @echo "Skipping Dopamine build: xcrun not found."
else
        $(MAKE) -C Dopamine
endif

%:
	@echo "No target rule for $@"

clean:
	@./BaseBin/clean.sh

update: all
	@./jbupdate.sh
