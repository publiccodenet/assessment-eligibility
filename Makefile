# SPDX-License-Identifier: CC0-1.0

# ensure `lein` is installled
# sudo apt install leiningen

SHELL := bash
BROWSER ?= firefox

default: all

choices/project.clj:
	git submodule update --init --recursive
	ls -l choices/project.clj
	@echo SUCCESS $@

choices/resources/public/js/choices.js: choices/project.clj config.yml
	cp -v config.yml choices/config.yml
	cd choices && lein fig:min
	ls -l choices/resources/public/js/choices.js
	@echo SUCCESS $@

choices/resources/public/index.html: choices/resources/public/js/choices.js
	ls -l choices/resources/public/index.html
	touch choices/resources/public/index.html
	@echo SUCCESS $@

.PHONY: all
all: choices/resources/public/index.html
	@echo SUCCESS $@

.PHONY: view
view: choices/resources/public/index.html
	$(BROWSER) choices/resources/public/index.html &
	@echo SUCCESS $@

.PHONY: choices-test
choices-test: choices/project.clj
	cd choices && lein test
	@echo SUCCESS $@

.PHONY: check
check: choices-test
	@echo SUCCESS $@

.PHONY: clean
clean:
	git clean -dffx
	git submodule foreach --recursive git clean -dffx
	git submodule foreach --recursive git reset --hard
	@echo SUCCESS $@
