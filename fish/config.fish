##########
# env
##########

# global
set -x TERM xterm-256color
set -U FZF_TMUX 1
set -x fish_emoji_width 2
set -x fish_ambiguous_width 2
export EDITOR=vim

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
~/.rbenv/bin/rbenv init - | source

# nodenv
set -x PATH $HOME/.nodenv/bin $PATH
~/.nodenv/bin/nodenv init - | source

# goenv
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
~/.goenv/bin/goenv init - | source
set -x PATH $GOROOT/bin $PATH
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# pyenv
 set -x PYENV_ROOT $HOME/.pyenv
 set -x PATH $PYENV_ROOT/bin $PATH
 set -x PATH $PYENV_ROOT/shims $PATH
 ~/.pyenv/bin/pyenv init - | source

# rustup
set -x PATH $HOME/.cargo/bin $PATH

# ponyup
# set -x PATH $HOME/.local/share/ponyup/bin $PATH

# private env
if test -f $HOME/.env_private.fish
  source $HOME/.env_private.fish
end

##########
# aliases
##########

alias vim "nvim"
alias ls "ls -l -G --color"
alias gc "git branch | fzf | xargs git checkout"
alias gd "git branch | fzf | xargs git branch -D"
alias gp "git branch | fzf | xargs git push origin"
