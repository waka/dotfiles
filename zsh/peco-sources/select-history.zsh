function peco-select-history() {
  typeset tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -n 1 | eval $tac | peco --prompt "[history]" --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N peco-select-history
