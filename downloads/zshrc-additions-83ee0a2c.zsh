# ============================================================
#  zshrc-additions.zsh  —  pentest / CPTS workflow
#
#  DO NOT replace Kali's ~/.zshrc (it has the nice prompt,
#  syntax highlighting, and autosuggestions). APPEND this instead:
#
#      cat zshrc-additions.zsh >> ~/.zshrc
#      source ~/.zshrc
#
#  Everything below is additive and safe.
# ============================================================

# ---- History: bigger, shared between panes, no dup spam ----
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY          # all tmux panes share one history
setopt HIST_IGNORE_ALL_DUPS   # drop older duplicate commands
setopt HIST_IGNORE_SPACE      # commands starting with a space aren't saved
setopt INC_APPEND_HISTORY     # write as you go, not just on exit

# ---- Better directory navigation ----
setopt AUTO_CD                # type a dir name to cd into it
setopt AUTO_PUSHD             # cd pushes onto the dir stack
setopt PUSHD_IGNORE_DUPS

# ---- Make Ctrl+R / word-jumps behave like the cheat sheet ----
bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[1;5C' forward-word        # Ctrl+Right
bindkey '^[[1;5D' backward-word       # Ctrl+Left

# ============================================================
#  Aliases
# ============================================================

# ---- Navigation ----
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# ---- Safer file ops ----
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ---- Search / grep ----
alias grep='grep --color=auto'
alias ports='ss -tulpn'

# ---- Networking (HTB/CPTS uses tun0) ----
# `vpnip` prints your VPN IP — handy for reverse shells / LHOST
alias vpnip="ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias myip='vpnip'
alias serve='python3 -m http.server 80'   # quick file-transfer web server

# ---- Listener: `pwncat 4444` (defaults to 4444) ----
listen() { local p="${1:-4444}"; echo "[*] nc listening on $p"; nc -lvnp "$p"; }

# ---- mkcd: make a dir and jump into it ----
mkcd() { mkdir -p "$1" && cd "$1"; }

# ---- target: store the box IP once, reuse it everywhere ----
#   usage:  settarget 10.10.10.10   then use  $TARGET  in any command
settarget() { export TARGET="$1"; echo "TARGET=$TARGET"; }
alias target='echo $TARGET'

# ---- Quick nmap profiles (need sudo for -sS / -sU) ----
# fast full-port scan, then service scan on found ports
alias nmap-quick='sudo nmap -p- --min-rate 5000 -T4'
alias nmap-full='sudo nmap -sCV -p'   # usage: nmap-full 22,80,443 <ip>

# ---- Stabilize a reverse shell (run AFTER you catch it) ----
# 1) in the shell:  pyshell
# 2) Ctrl+z  ->  then on your box:  stty raw -echo; fg  ->  export TERM=xterm
alias pyshell="python3 -c 'import pty;pty.spawn(\"/bin/bash\")'"

# ---- Make/extract a directory of loot quickly ----
alias loot='mkdir -p nmap web exploits loot && ls'

# ============================================================
#  End of additions
# ============================================================
