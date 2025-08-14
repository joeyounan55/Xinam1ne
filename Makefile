all:
	@./BaseBin/pack.sh
	@xattr -rc Tools >/dev/null 2>&1
	$(MAKE) -C Exploits/oobPCI
	$(MAKE) -C Dopamine

%:
	@echo "No target rule for $@"

clean:
	@./BaseBin/clean.sh

test:
	@echo "Running submodule tests"
	@$(MAKE) -C Tools test >/dev/null 2>&1 || echo "No test target in Tools"
	@for dir in Tools/*; do \
	if [ -d $$dir ] && [ -f $$dir/Package.swift ]; then \
	echo "Running Swift tests for $$dir"; \
	(cd $$dir && swift test) || true; \
	fi; \
	done

update: all
	@./jbupdate.sh
