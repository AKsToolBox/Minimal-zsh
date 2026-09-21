# =========================================================
# Keybindings
# =========================================================

# Cursor shape per vi mode
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

# Disable command mode line highlight
ZVM_VI_HIGHLIGHT_BACKGROUND=none
ZVM_VI_HIGHLIGHT_FOREGROUND=none
ZVM_VI_HIGHLIGHT_EXTRASTYLE=none

# zsh-vi-mode resets all bindings on init, so custom bindings
# must be registered via this hook to survive.
zvm_after_init() {

  # ---------------------------------------------------------
  # 1. CHARACTER NAVIGATION
  # ---------------------------------------------------------
  bindkey '^F' forward-char                # Ctrl+F -> Forward one character
  bindkey '^B' backward-char               # Ctrl+B -> Backward one character

  # ---------------------------------------------------------
  # 2. LINE NAVIGATION
  # ---------------------------------------------------------
  bindkey '^A' beginning-of-line          # Ctrl+A -> Start of line
  bindkey '^E' end-of-line                # Ctrl+E -> End of line

  # ---------------------------------------------------------
  # 3. WORD NAVIGATION
  # ---------------------------------------------------------
  bindkey '^[[1;5C' forward-word          # Ctrl+Right -> Forward word
  bindkey '^[[1;5D' backward-word         # Ctrl+Left -> Backward word
  bindkey '^[f' forward-word              # Alt+F -> Forward word
  bindkey '^[b' backward-word             # Alt+B -> Backward word

  # ---------------------------------------------------------
  # 4. WORD DELETION
  # ---------------------------------------------------------
  bindkey '^W' backward-kill-word         # Ctrl+W -> Kill word backward
  bindkey '^[^?' backward-kill-word       # Alt+Backspace -> Kill word backward
  bindkey '^[[3;3~' backward-kill-word    # Alt+Backspace (alt sequence)
  bindkey '^[^H' backward-kill-word       # Alt+Backspace (alt sequence)
  bindkey '^[d' kill-word                 # Alt+D -> Kill word forward

  # ---------------------------------------------------------
  # 5. LINE DELETION
  # ---------------------------------------------------------
  bindkey '^U' backward-kill-line         # Ctrl+U -> Kill to beginning of line
  bindkey '^K' kill-line                  # Ctrl+K -> Kill to end of line

  # ---------------------------------------------------------
  # 6. FZF FILE PICKER
  # ---------------------------------------------------------
  bindkey '^G' _fzf_file_no_hidden        # Ctrl+G -> fzf (no hidden files)

  # ---------------------------------------------------------
  # 7. AUTOSUGGESTIONS
  # ---------------------------------------------------------
  bindkey '^\' autosuggest-toggle         # Ctrl+\ -> Toggle autosuggestions

  # ---------------------------------------------------------
  # 8. HISTORY SEARCH
  # ---------------------------------------------------------
  bindkey '^[[A' history-substring-search-up    # Up arrow -> Search history
  bindkey '^[[B' history-substring-search-down  # Down arrow -> Search history
}
