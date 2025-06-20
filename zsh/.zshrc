# Binaries
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Config folder
export XDG_CONFIG_HOME=$HOME/.config

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh"

# Theme to load
ZSH_THEME="refined"

# Plugins to load
plugins=(docker git kubectl vi-mode)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Widgets
tmux-sessionizer-widget() {
	if command -v tmux-sessionizer &> /dev/null; then
		BUFFER="tmux-sessionizer"
		zle accept-line
	fi
}
zle -N tmux-sessionizer-widget

# Keybinds
bindkey -v
export KEYTIMEOUT=1

bindkey -M vicmd "^T" tmux-sessionizer-widget
bindkey -M viins "^T" tmux-sessionizer-widget

# User configuration
source ~/.zsh_profile
