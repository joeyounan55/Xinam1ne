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

test:
	@sh -n BaseBin/pack.sh
	@sh -n jbupdate.sh
	@tail -c 1 BaseBin/pack.sh | od -An -t o1 | grep -q '012' || { echo 'BaseBin/pack.sh: missing trailing newline'; exit 1; }
	@tail -c 1 jbupdate.sh | od -An -t o1 | grep -q '012' || { echo 'jbupdate.sh: missing trailing newline'; exit 1; }
