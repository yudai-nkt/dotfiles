DOTDIR := $(PWD)
EXCLUDES := .gitignore Makefile $(wildcard *.md) $(shell find script -type f) vscode/settings.json
DOTFILES := $(filter-out $(EXCLUDES), $(shell git ls-files))

list:
	@echo 'Dotfiles to be deployed are as follows.'
	@echo $(DOTFILES) | tr ' ' '\n'

init:
	@echo 'Initialize this computer.'
	@DOTDIR=$(DOTDIR) bash $(DOTDIR)/script/init.sh

symlink:
	@echo 'Symlink dotfiles into home directory.'
	@DOTDIR=$(DOTDIR) bash $(DOTDIR)/script/symlink.sh

update:
	@echo 'Update this repository.'
	git pull origin master

install: update symlink init
	@exec $${SHELL} --login
