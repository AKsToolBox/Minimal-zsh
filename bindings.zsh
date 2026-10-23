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
# 2. FZF FILE PICKER (Moved to Alt+G so it doesn't hijack Ctrl+G)
# ---------------------------------------------------------
bindkey '^[g' _fzf_file_no_hidden        # Alt+G -> fzf (no hidden files)

# ---------------------------------------------------------
# 2b. NAVI CHEATSHEET WIDGET (Native Ctrl+G + clean Alt+N)
# ---------------------------------------------------------
if (( $+widgets[_navi_widget] )); then
  bindkey '^G' _navi_widget             # Ctrl+G -> navi cheatsheet widget (official default)
  bindkey '^[n' _navi_widget            # Alt+N  -> alternate cheatsheet shortcut
fi

# ---------------------------------------------------------
# 3. AUTOSUGGESTIONS
# ---------------------------------------------------------
bindkey '^\' autosuggest-toggle         # Ctrl+\ -> Toggle autosuggestions

# ---------------------------------------------------------
# 4. HISTORY SEARCH (Native Bash / Emacs matching)
# ---------------------------------------------------------
bindkey '^[[A' history-substring-search-up    # Up arrow -> Previous history
bindkey '^[[B' history-substring-search-down  # Down arrow -> Next history
bindkey '^P' history-substring-search-up      # Ctrl+P   -> Previous history (like Bash)
bindkey '^N' history-substring-search-down    # Ctrl+N   -> Next history (like Bash)