# =========================================================
# Ezlo (Spec-driven Autocomplete, Ghost Text & Recipe Launcher)
# =========================================================

if command -v ezlo >/dev/null 2>&1; then
  # Enable ezlo's native inline ghost-text autosuggestions from history & specs
  export EZLO_GHOST=on

  # ---------------------------------------------------------
  # Key Mappings (Alt + & Ctrl +)
  # ---------------------------------------------------------
  zstyle ':ezlo:keys' pick '^[r'        # Alt+R  : Recipe picker & parameter filler
  zstyle ':ezlo:keys' popup '^[p'       # Alt+P  : Settings popup menu (moved from Alt+E)
  zstyle ':ezlo:keys' explain '^[e'     # Alt+E  : Token explanation & diagnostics (moved from Alt+H)
  zstyle ':ezlo:keys' search '^R'       # Ctrl+R : Ezlo history search (replaces fzf search)
  zstyle ':ezlo:keys' translate '^[k'   # Alt+K  : Natural language translation
  zstyle ':ezlo:keys' ghost-end '^E'    # Ctrl+E : Accept ghost text + jump to end of line
  zstyle ':ezlo:keys' recall '^J'       # Ctrl+J : Workflow recall (replaces _ezlo_enter on ^J)

  # Initialize ezlo integration
  eval "$(ezlo init zsh)"

  # Revert Alt+H to native run-help and release Alt+J
  bindkey '^[h' run-help
  bindkey '^[H' run-help
  bindkey -r '^[j' 2>/dev/null || true

  # Bind Ctrl+\ to toggle ezlo suggestions & ghost text on/off
  bindkey '^\' _ezlo_toggle

  # Bind Alt+K to Gemini natural language command translation widget
  bindkey '^[k' _ezlo_ai_query
fi
