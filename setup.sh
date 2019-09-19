#!
ZSH_PATH=$HOME/.zshrc

function install_brew {
  printf '%s\n' "Installing Homebrew"
	mkdir $HOME/.brew && curl -fsSL https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/.brew
	mkdir -p /tmp/.$(whoami)-brew-locks
	mkdir -p $HOME/.brew/var/homebrew
	ln -s /tmp/.$(whoami)-brew-locks $HOME/.brew/var/homebrew/locks
	#export PATH="$HOME/.brew/bin:$PATH"
	echo 'mkdir -p /tmp/.$(whoami)-brew-locks' >> $ZSH_PATH
	echo 'export PATH="$HOME/.brew/bin:$PATH"' >> $ZSH_PATH
  source $ZSH_PATH
  printf '%s\n' "Done Installing Homebrew"
}

if [ ! -d "$HOME/.brew" ]; then
    install_brew
fi

printf '%s\n' "Updating Homebrew"
brew update && brew upgrade

printf '%s\n' "Homebrew update complete"

command -v node >/dev/numm 2>&1 || install_node
printf '%s\n' "Node Installed"

exec /bin/zsh
