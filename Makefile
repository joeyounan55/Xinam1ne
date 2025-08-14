ifeq ($(OS),Windows_NT)
TOOLCHAIN ?= clang
XATTR :=
else
TOOLCHAIN ?= xcrun -sdk iphoneos clang
XATTR := xattr -rc Tools >/dev/null 2>&1
endif

all:
	@TOOLCHAIN="$(TOOLCHAIN)" SDK_PATH="$(SDK_PATH)" ./BaseBin/pack.sh
	@$(if $(XATTR),$(XATTR),true)
	$(MAKE) -C Exploits/oobPCI TOOLCHAIN="$(TOOLCHAIN)" SDK_PATH="$(SDK_PATH)"
	$(MAKE) -C Dopamine TOOLCHAIN="$(TOOLCHAIN)" SDK_PATH="$(SDK_PATH)"

%:
	@echo "No target rule for $@"

clean:
	@./BaseBin/clean.sh

update: all
	@./jbupdate.sh

