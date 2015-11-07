function peco-cdr () {
  local selected_dir=$(cdr -l | awk '{ print $2 }' | peco --prompt "[cd]")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle redisplay
}
zle -N peco-cdr
