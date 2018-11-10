DOTDIR := $(PWD)
EXCLUDES := .gitignore Makefile README.md $(shell find script -type f)
DOTFILES := $(filter-out $(EXCLUDES), $(shell git ls-files))

list:
	@echo 'Dotfiles to be deployed are as follows.'
	@echo $(DOTFILES) | tr  ' ' '\n'

symlink:
	@echo 'Symlink dotfiles into home directory.'
	@DOTDIR=$(DOTDIR) bash $(DOTDIR)/script/symlink.sh

update:
	@echo 'Update this repository.'
	git pull origin master

install: update symlink
	@exec $${SHELL} --login
