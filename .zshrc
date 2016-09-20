source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOF
npm
bower
colored-man
nojhan/liquidprompt
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
EOF
antigen apply

# rm -f ~/.zcompdump; compinit

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export WORDCHARS='*?[]~&;!$%^<>'

eval "$(direnv hook $0)"
