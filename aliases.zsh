# Better ls
alias ls='eza --icons'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='batcat'

alias fd='fdfind'

# =========================================================
# Core utilities
# =========================================================

# alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git -C "${ZDOTDIR:-$HOME/.config/zsh}"'

# =========================================================
# Video
# =========================================================

alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'

# =========================================================
# Antigravity / Haven MCP Notifications
# =========================================================

alias haven-notify='/vm-storage/pentest/Working/scripts/haven-notify.py'

# =========================================================
# AI / Pentest Tools
# =========================================================

alias pentest-ai='/vm-storage/AI/scripts/venv/bin/python /vm-storage/AI/scripts/pentest_ai.py'

# =========================================================
# PC Controls MCP Server
# =========================================================

alias pc-controls-mcp='/vm-storage/AI/scripts/venv/bin/python /vm-storage/AI/scripts/pc_controls_mcp.py'

# =========================================================
# Safe Crisis Power-Down / Preservation
# =========================================================

alias safe-powerdown='bash /vm-storage/AI/scripts/safe_powerdown.sh'
alias safe-powerdown-dry='bash /vm-storage/AI/scripts/safe_powerdown.sh --dry-run'

