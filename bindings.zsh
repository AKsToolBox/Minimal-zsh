# =========================================================
# Keybindings (Native Emacs / Bash mode)
# =========================================================

# Establish native Bash/Emacs keymap as baseline
bindkey -e

# ---------------------------------------------------------
# 1. WORD NAVIGATION & TERMINAL COMPATIBILITY
# ---------------------------------------------------------
bindkey '^[[1;5C' forward-word          # Ctrl+Right -> Forward word
bindkey '^[[1;5D' backward-word         # Ctrl+Left -> Backward word
bindkey '^[^?' backward-kill-word       # Alt+Backspace -> Kill word backward
bindkey '^[[3;3~' backward-kill-word    # Alt+Backspace (alt sequence)
bindkey '^[^H' backward-kill-word       # Alt+Backspace (alt sequence)
bindkey '^[d' kill-word                 # Alt+D -> Kill word forward

# ---------------------------------------------------------
# 2. NAVI CHEATSHEET
# ---------------------------------------------------------
if (( $+widgets[_navi_widget] )); then
  bindkey '^G' _navi_widget             # Ctrl+G -> navi cheatsheet widget
fi

# ---------------------------------------------------------
# 2b. FZF FILE PICKER
# ---------------------------------------------------------
if (( $+widgets[_fzf_file_no_hidden] )); then
  bindkey '^F' _fzf_file_no_hidden      # Ctrl+F -> fzf (no hidden files)
fi

# ---------------------------------------------------------
# 3. AUTOSUGGESTIONS
# ---------------------------------------------------------
bindkey '^\' autosuggest-toggle         # Ctrl+\ -> Toggle autosuggestions

# ---------------------------------------------------------
# 4. HISTORY NAVIGATION & SEARCH (Bash / Emacs Mode)
# ---------------------------------------------------------
bindkey '^P' up-line-or-history               # Ctrl+P -> Previous history
bindkey '^N' down-line-or-history             # Ctrl+N -> Next history (like bash)
bindkey '^[[A' history-substring-search-up    # Up arrow -> Search history
bindkey '^[[B' history-substring-search-down  # Down arrow -> Search history