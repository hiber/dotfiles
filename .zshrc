source `brew --prefix`/share/antigen.zsh
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

if [[ -f $HOME/.composer/vendor/drush/drush/drush.complete.sh ]]; then
  autoload bashcompinit
  bashcompinit
  source $HOME/.composer/vendor/drush/drush/drush.complete.sh
fi
# rm -f ~/.zcompdump; compinit

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export WORDCHARS='*?[]~&;!$%^<>'

eval "$(direnv hook $0)"
