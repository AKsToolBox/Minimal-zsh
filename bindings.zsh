# =========================================================
# Keybindings (Native Emacs / Bash mode)
# =========================================================

# Establish native Bash/Emacs keymap as baseline
bindkey -e

# ---------------------------------------------------------
# 1. WORD & CHARACTER NAVIGATION (Bash / Emacs Compatibility)
# ---------------------------------------------------------
bindkey '^F' .forward-char              # Ctrl+F -> strictly 1 char forward (never accepts ghost text)
bindkey '^B' .backward-char             # Ctrl+B -> strictly 1 char backward
bindkey '^[f' forward-word              # Alt+F -> Forward word
bindkey '^[F' forward-word              # Alt+Shift+F -> Forward word
bindkey '^[b' backward-word             # Alt+B -> Backward word
bindkey '^[B' backward-word             # Alt+Shift+B -> Backward word
bindkey '^[[1;5C' forward-word          # Ctrl+Right -> Forward word
bindkey '^[[1;5D' backward-word         # Ctrl+Left -> Backward word
bindkey '^[^?' backward-kill-word       # Alt+Backspace -> Kill word backward
bindkey '^[[3;3~' backward-kill-word    # Alt+Backspace (alt sequence)
bindkey '^[^H' backward-kill-word       # Alt+Backspace (alt sequence)
bindkey '^[d' kill-word                 # Alt+D -> Kill word forward
bindkey '^U' backward-kill-line         # Ctrl+U -> Kill line backward (Bash style)

# ---------------------------------------------------------
# 2. FZF FILE PICKER
# ---------------------------------------------------------
bindkey '^G' _fzf_file_no_hidden        # Ctrl+G -> fzf (no hidden files)

# ---------------------------------------------------------
# 3. AUTOSUGGESTIONS (Fallback when ezlo is not active)
# ---------------------------------------------------------
if (( $+widgets[autosuggest-toggle] )); then
  bindkey '^\' autosuggest-toggle       # Ctrl+\ -> Toggle autosuggestions
fi

# ---------------------------------------------------------
# 4. HISTORY NAVIGATION & SEARCH (Bash / Emacs Mode)
# [AI-GUARD: DO NOT REMAP OR OVERRIDE Ctrl+N / Ctrl+P]
# ---------------------------------------------------------
bindkey '^P' up-line-or-history               # Ctrl+P -> Previous history (like Bash)
bindkey '^N' down-line-or-history             # Ctrl+N -> Next history (like Bash)
bindkey '^[[A' history-substring-search-up    # Up arrow -> Search history
bindkey '^[[B' history-substring-search-down  # Down arrow -> Search history
