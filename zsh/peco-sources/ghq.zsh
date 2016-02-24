function peco-ghq() {
  local selected_dir=$(ghq list -p | peco --prompt "[ghq]" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle redisplay
}
zle -N peco-ghq
