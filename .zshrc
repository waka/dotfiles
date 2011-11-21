autoload -U compinit
compinit -u

export LANG=ja_JP.UTF-8

bindkey -e
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=1000

setopt magic_equal_subst
setopt pushd_ignore_dups

PROMPT="%n%% "

export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar:/usr/share/java/servlet-api-2.5.jar
export PATH=/usr/local/mysql/bin:$PATH

source ~/.nvm/nvm.sh
nvm use "v0.4.12"

if [ $TERM = "screen" ]; then
  preexec() {
    echo -ne "\ek$1\e\\"
  }
  precmd() {
    echo -ne "\ek$(basename $SHELL)\e\\"
  }
fi
