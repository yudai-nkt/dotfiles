DOTDIR := $(PWD)
EXCLUDES := .gitignore Makefile README.md
DOTFILES := $(filter-out $(EXCLUDES), $(shell git ls-files))

list:
	@echo 'List the dotfiles to be deployed.'
	@echo $(DOTFILES) | tr  ' ' '\n'

symlink:
	@echo 'Symlinking dotfiles into home directory...'
	@$(foreach dotfile, $(DOTFILES), ln -sfnv $(DOTDIR)/$(dotfile) $(HOME)/$(dotfile);)
	@echo 'Target symlink done!'

update:
	git pull origin master
