# =========================================================
# fzf
# =========================================================

# Default command: fdfind (faster find alternative)
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --strip-cwd-prefix'

# Ctrl-T uses the same command (shows ALL files, including hidden)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# UI configuration
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

# Preview command using batcat
export _FZF_PREVIEW_CMD='batcat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# Custom fzf picker: excludes hidden files
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
