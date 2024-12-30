DOTDIR := $(PWD)
EXCLUDES := .github .gitignore .stylua.toml
DOTFILES := $(filter-out $(EXCLUDES), $(filter .%, $(shell git ls-tree --name-only HEAD)))

list:
	@echo 'Dotfiles to be deployed are as follows.'
	@echo $(DOTFILES) | tr ' ' '\n'

init:
	@echo 'Initialize this computer.'
	@DOTDIR=$(DOTDIR) PATH=/opt/homebrew/bin:$${PATH} bash $(DOTDIR)/script/init.sh

symlink:
	@echo 'Symlink dotfiles into home directory.'
	@DOTDIR=$(DOTDIR) bash $(DOTDIR)/script/symlink.sh

update:
	@echo 'Update this repository.'
	git pull origin master

install: update symlink init
	@exec $${SHELL} --login
