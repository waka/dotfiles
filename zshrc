# basic
export LANG=ja_JP.UTF-8
autoload -U compinit
compinit -u
autoload -U colors
colors

# git
autoload -Uz vcs_info
setopt prompt_subst

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  vcs_info
}
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT='${vcs_info_msg_0_}'

# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# プロンプト表示形式
PROMPT='%(5~,%-2~/.../%2~,%~)%# '

# Emacsキーバインド
bindkey -e

# 履歴
HISTFILE=$HOME/.zsh-history
HISTSIZE=3000
SAVEHIST=3000

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

# Colorize
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
case "${OSTYPE}" in
  darwin*)
    alias ls="ls -G"
    ;;
  linux*)
    alias ls='ls --color'
    ;;
esac

# Use user local
export PATH=/usr/local/bin:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/shims:$PATH

# nodenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

# go
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# rust
export PATH=$PATH:/usr/local/rust/bin
export DYLD_LIBRARY_PATH=/usr/local/rust/lib

# peco
for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
bindkey '^r' peco-select-history
bindkey '^@' peco-cdr
bindkey '^f' peco-find-file
bindkey '^g' peco-ghq
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

# cdd
if [ -f /usr/local/bin/cdd ]; then
  source /usr/local/bin/cdd
  chpwd() {
    _cdd_chpwd
  }
fi

# 環境ごと
[ -f ~/.zshrc.private ] && source ~/.zshrc.private

# added by travis gem
[ -f /home/vagrant/.travis/travis.sh ] && source /home/vagrant/.travis/travis.sh
