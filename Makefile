DOTDIR := $(PWD)
EXCLUDES := .git Makefile README.md gitconfig gitignore_global latexmkrc zshenv zshrc atom/snippets.cson atom/styles.less .gitignore
DOTFILES := $(filter-out $(EXCLUDES), $(shell git ls-files))

list:
	@echo $(DOTDIR)
	@echo $(DOTFILES)
	
symlink:
	@echo 'Symlinking dotfiles into home directory...'
	@$(foreach dotfile, $(DOTFILES), ln -sfnv $(DOTDIR)/$(dotfile) $(HOME)/$(dotfile);)
	@echo 'Target symlink done!'
	
update:
	git pull origin master