export LANG=ja_JP.UTF-8
autoload -U compinit
compinit -u
autoload -U colors
colors


# プロンプト表示形式
PROMPT="%n%% "

# Emacsキーバインド
bindkey -e

# 履歴
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000
SAVEHIST=1000

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# シェルのプロセスごとに履歴を共有
setopt share_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
#setopt auto_menu

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

# 色を使う
setopt prompt_subst

# ビープ音を鳴らさないようにする
setopt NO_beep

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# lsの色設定
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls='ls --color=auto'


# java
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
alias be="bundle exec"

# node.js
export PATH=$HOME/.nodebrew/current/bin:$PATH

# mysql
export PATH=/usr/local/mysql/bin:$PATH

# redis
alias redis-server="/usr/local/redis/src/redis-server /usr/local/redis/redis.conf"

# mongodb
alias mongod="/usr/local/mongodb/bin/mongod -f /usr/local/mongodb/mongodb.conf"


if [ $TERM = "screen" ]; then
  preexec() {
    echo -ne "\ek$1\e\\"
  }
  precmd() {
    echo -ne "\ek$(basename $SHELL)\e\\"
  }
fi
