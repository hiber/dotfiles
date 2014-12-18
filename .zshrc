export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.cask/bin:$PATH

source $HOME/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOF
sindresorhus/pure
zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
EOF
antigen apply

# rm -f ~/.zcompdump; compinit

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export WORDCHARS='*?[]~&;!$%^<>'

export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376




