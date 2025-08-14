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
	@echo "Checking shell script syntax..."
	@find . -name '*.sh' -print0 | xargs -0 -n1 sh -n
	@echo "All shell scripts parsed successfully."

update: all
	@./jbupdate.sh
