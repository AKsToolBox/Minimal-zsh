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
# 2. FZF FILE PICKER
# ---------------------------------------------------------
bindkey '^G' _fzf_file_no_hidden        # Ctrl+G -> fzf (no hidden files)

# ---------------------------------------------------------
# 3. AUTOSUGGESTIONS
# ---------------------------------------------------------
bindkey '^\' autosuggest-toggle         # Ctrl+\ -> Toggle autosuggestions

# ---------------------------------------------------------
# 4. HISTORY SEARCH
# ---------------------------------------------------------
bindkey '^[[A' history-substring-search-up    # Up arrow -> Search history
bindkey '^[[B' history-substring-search-down  # Down arrow -> Search history