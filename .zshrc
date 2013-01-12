autoload -U compinit
compinit -u
autoload -U colors
colors

export LANG=ja_JP.UTF-8

bindkey -e
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=1000

setopt magic_equal_subst
setopt pushd_ignore_dups
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

PROMPT="%n%% "

# java
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"


if [ $TERM = "screen" ]; then
  preexec() {
    echo -ne "\ek$1\e\\"
  }
  precmd() {
    echo -ne "\ek$(basename $SHELL)\e\\"
  }
fi
