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

  # Partial-word ghost text accept for Alt+F and Ctrl+Right:
  # - At end of line with ghost text: accepts 1 word of _ezlo_ghost
  # - Inside line or without ghost text: moves forward 1 word (.forward-word)
  _ezlo_forward_word() {
    _ezlo_on_redraw
    if [[ -n $_ezlo_ghost && $CURSOR == ${#BUFFER} ]]; then
      local -i orig_len=${#BUFFER}
      BUFFER+=$_ezlo_ghost
      zle .forward-word
      if (( CURSOR > orig_len )); then
        BUFFER=${BUFFER[1,$CURSOR]}
      else
        BUFFER=${BUFFER[1,$orig_len]}
      fi
      _ezlo_on_redraw
      zle -R
    else
      zle .forward-word
    fi
  }
  zle -N _ezlo_forward_word
  bindkey '^[f' _ezlo_forward_word
  bindkey '^[F' _ezlo_forward_word
  bindkey '^[[1;5C' _ezlo_forward_word

  # Bind Ctrl+\ to toggle ezlo suggestions & ghost text on/off
  bindkey '^\' _ezlo_toggle
fi
