function fish_prompt
  if [ $status -eq 0 ]
    set status_face (set_color green)"(*'-') < "
  else
    set status_face (set_color blue)"(*;-;) < "
  end

  set prompt (set_color yellow)(prompt_pwd)

  echo "$prompt $status_face"
end

function fish_right_prompt
  if git_is_repo
    set -l git_color (set_color green)
    set -l branch_name (git_branch_name)
    set -l git_branch_glyph

    if git_is_touched
      set git_color (set_color yellow)

      if git_is_staged
        set git_color (set_color yellow)

        if git_is_dirty
          set git_branch_glyph " (±) "
        else
          set git_branch_glyph " (+) "
        end
      else
        set git_color (set_color red)
        set git_branch_glyph " (?) "
      end
    end

    echo "$git_color$git_branch_glyph$branch_name$git_color "
  end
end
