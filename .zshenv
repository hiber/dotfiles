export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$(brew --prefix homebrew/php/php56)/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

if [[ -e /usr/local/opt/chruby/share/chruby ]]; then
  # Load chruby
  source '/usr/local/opt/chruby/share/chruby/chruby.sh'

  # Set a default ruby if a .ruby-version file exists in the home dir
  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  fi
fi
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
# boot2docker
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
export DB_PORT_3306_TCP_ADDR=192.168.59.103
