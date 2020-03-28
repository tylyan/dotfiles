all: install

.ONESHELL:
SHELL = /bin/bash
install:
	@for f in *
	@do
	@	[[ "$$f" != "Makefile" ]] && stow -v $$f
	@done

.ONESHELL:
SHELL = /bin/bash
clean:
	@for f in *
	@do
	@	[[ "$$f" != "Makefile" ]] && stow -vD $$f
	@done
