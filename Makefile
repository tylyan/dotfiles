TOOLS=shell zsh tmux vim

all: install

.ONESHELL:
SHELL = /bin/bash
install:
	@for f in ${TOOLS}
	@do
	@stow -v $$f
	@done

.ONESHELL:
SHELL = /bin/bash
clean:
	@for f in ${TOOLS}
	@do
	@stow -vD $$f
	@done
