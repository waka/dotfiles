##########
# env
##########

# global
set -x TERM xterm-256color
set -x PATH /usr/local/bin $PATH
export EDITOR=vim

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH

# nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH

# go
set -x GOPATH $HOME/.go
set -x PATH /usr/local/opt/go/libexec/bin $GOPATH/bin $PATH

# rustup
set -x PATH $HOME/.cargo/bin $PATH
# racer
set -x RUST_SRC_PATH $HOME/work/src/rustc-nightly/src

# private env
if test -f $HOME/.env_private.fish
  source $HOME/.env_private.fish
end

##########
# variable
##########

set -U FZF_TMUX 1

##########
# aliases
##########

alias vim nvim
alias ls "ls -G"
alias gc "git branch | fzf | xargs git checkout"
alias gd "git branch | fzf | xargs git branch -D"
alias gp "git branch | fzf | xargs git push origin"
