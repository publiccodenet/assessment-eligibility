# SPDX-License-Identifier: CC0-1.0

# ensure clj is installed
# https://clojure.org/guides/install_clojure#posix

# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# $@ : target label
# $< : the first prerequisite after the colon
# $^ : all of the prerequisite files

SHELL := bash
BROWSER ?= firefox
CLJ ?= clj

.PHONY: default
default: all

choices/LICENSE:
	git submodule update --init --recursive
	ls -l $@
	@echo SUCCESS $@

choices/config.yml: choices/LICENSE config.yml
	cp -v config.yml choices/config.yml

choices/resources/public/js/choices.js: choices/LICENSE choices/config.yml
	cd choices && $(CLJ) -M:js
	ls -l $@
	@echo SUCCESS $@

choices/resources/public/index.html: choices/resources/public/js/choices.js
	ls -l $@
	touch $@
	@echo SUCCESS $@

.PHONY: all
all: choices/resources/public/index.html
	@echo SUCCESS $@

.PHONY: view
view: choices/resources/public/index.html
	$(BROWSER) $<
	@echo SUCCESS $@

.PHONY: choices-test
choices-test: choices/LICENSE choices/config.yml
	cd choices && $(CLJ) -M:test
	@echo SUCCESS $@

.PHONY: check
check: choices-test
	@echo SUCCESS $@

.PHONY: update-submodules
update-submodules:
	git submodule update --init --recursive
	@echo SUCCESS $@

.PHONY: clean
clean:
	git clean -dffx
	git submodule foreach --recursive git clean -dffx
	@echo SUCCESS $@
