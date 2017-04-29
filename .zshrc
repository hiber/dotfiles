source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOF
  bower
  colored-man
  nojhan/liquidprompt
  npm
  zsh-users/zsh-completions src
EOF
antigen apply

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
