all:
	@./BaseBin/pack.sh
	@xattr -rc Tools >/dev/null 2>&1
	$(MAKE) -C Exploits/oobPCI
	$(MAKE) -C Dopamine

%:
	@echo "No target rule for $@"

clean:
	@if [ -x ./BaseBin/clean.sh ]; then \
		./BaseBin/clean.sh; \
	else \
		echo "Warning: BaseBin/clean.sh not found"; \
	fi

update: all
	@./jbupdate.sh
