all:
	@./BaseBin/pack.sh
	@xattr -rc Tools >/dev/null 2>&1
	$(MAKE) -C Exploits/oobPCI
	if [ -f Dopamine/Makefile ]; then $(MAKE) -C Dopamine; fi

%:
	@echo "No target rule for $@"

clean:
	@./BaseBin/clean.sh

update: all
	@./jbupdate.sh
