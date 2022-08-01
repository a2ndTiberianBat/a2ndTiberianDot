# Aliases
source "$ZDOTDIR/alias.zsh"

# Enable ZSH Autocomplete
autoload -Uz compinit promptinit
compinit

# GPG-Agent Configuration
if which gpg-agent>/dev/null 2>&1; then
    eval "$(gpgconf --launch gpg-agent)"
fi
gpg-connect-agent updatestartuptty /bye >/dev/null

# Better Vi Mode for ZSH
function zvm_after_init() {
    zvm_bindkey viins 'jk' zvm_exit_insert_mode
    zvm_bindkey viins 'kj' zvm_exit_insert_mode
}
source $HOME/src/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Starship
export SPACESHIP_EXEC_TIME_SHOW=false
eval "$(starship init zsh)"
