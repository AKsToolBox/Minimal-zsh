# =========================================================
# Plugins
# =========================================================

ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_load() {
  local plugin_path="${ZPLUGINDIR}/${2}"
  if [[ ! -d "$plugin_path" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing ${2}..."
    git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
      || { echo "ERROR: failed to install ${2}" >&2; return 1; }
  fi
  source "${plugin_path}/${2}.plugin.zsh"
}

zplugin-update() {
  local dir
  for dir in "${ZPLUGINDIR}"/*/; do
    echo "Updating ${dir:t}..."
    git -C "$dir" pull --ff-only
  done
}

# Only load zsh-autosuggestions if ezlo is not installed.
# (ezlo provides native inline ghost-text autosuggestions + dropdown in POSTDISPLAY;
# running zsh-autosuggestions alongside ezlo causes async POSTDISPLAY overwrites and menu flicker.)
if ! command -v ezlo >/dev/null 2>&1; then
  typeset -ga ZSH_AUTOSUGGEST_ACCEPT_WIDGETS
  ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(end-of-line vi-end-of-line vi-add-eol)
  _zplugin_load zsh-users zsh-autosuggestions
fi

_zplugin_load zsh-users zsh-history-substring-search
