# SPDX-License-Identifier: CC0-1.0

# ensure `lein` is installled
# sudo apt install leiningen

SHELL := bash
BROWSER ?= firefox

default: all

choices/project.clj:
	git submodule update --init --recursive
	@echo SUCCESS $@

choices/config.yml: choices/project.clj config.yml
	cp -v config.yml choices/config.yml
	@echo SUCCESS $@

.PHONY: choices-test
choices-test: choices/project.clj
	cd choices && lein test
	@echo SUCCESS $@

.PHONY: choices-build
choices-build: choices/project.clj choices/config.yml
	cd choices && lein fig:min
	@echo SUCCESS $@

choices/resources/public/index.html: choices-build
	@echo SUCCESS $@

.PHONY: all
all: config.yml choices/resources/public/index.html
	@echo SUCCESS $@

.PHONY: view
view: choices/resources/public/index.html
	$(BROWSER) choices/resources/public/index.html

.PHONY: check
check: choices-test
	@echo SUCCESS $@

.PHONY: clean
clean:
	git clean -dffx
	git submodule foreach --recursive git clean -dffx
	git submodule foreach --recursive git reset --hard
	@echo SUCCESS $@
