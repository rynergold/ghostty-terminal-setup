
# === SDKMAN & RBENV PATHS (Directly on PATH for 0ms startup) ===
export SDKMAN_DIR="$HOME/.sdkman"
export PATH="$SDKMAN_DIR/candidates/java/current/bin:$SDKMAN_DIR/candidates/gradle/current/bin:$SDKMAN_DIR/candidates/kotlin/current/bin:$SDKMAN_DIR/candidates/maven/current/bin:$HOME/.rbenv/shims:$PATH"

# === BASIC PATHS ===
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/sqlite/bin:$HOME/bin:$HOME/.local/bin:$HOME/Library/Python/3.9/bin:$PATH"

# Antigravity IDE
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
# === DOCKER & TESTCONTAINERS (Colima on-demand) ===
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"
# === WORK SECRETS & LOCAL CONFIGS (Ignored in Git) ===
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# === LANGUAGE & PACKAGE MANAGERS (Lazy-loaded for 0ms shell launch) ===
# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# NVM (Node)
export NVM_DIR="$HOME/.config/nvm"
load_nvm() {
  unset -f nvm node npm yarn
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm() { load_nvm; nvm "$@"; }
node() { load_nvm; node "$@"; }
npm() { load_nvm; npm "$@"; }
yarn() { load_nvm; yarn "$@"; }

# SDKMAN (Java)
sdk() {
  unset -f sdk
  source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}

# rbenv (Ruby)
rbenv() {
  unset -f rbenv
  eval "$(command rbenv init - zsh)"
  rbenv "$@"
}

# Deno
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

# === FAST COMPLETIONS CACHE (1ms startup) ===
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# === ANTIDOTE PLUGIN MANAGER (zsh-vi-mode) ===
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# === CLI TOOLS & PRODUCTIVITY ===
# FZF (Fuzzy history search: Ctrl+R)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zoxide (Smarter cd)
command -v zoxide >/dev/null 2>&1 && eval "$(command zoxide init zsh)"
zn() {
  z "$@" && nvim .
}

# === PURE NATIVE ZSH PROMPT (0.00ms overhead) ===
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes false
zstyle ':vcs_info:git:*' formats ' %F{blue}|%f %F{magenta}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{blue}|%f %F{magenta}%b%f [%F{red}%a%f]'
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='%F{cyan}%1~%f${vcs_info_msg_0_}
%F{yellow}❯%f '

# === ALIASES & MODERN CLI REPLACEMENTS ===
# Gradle wrapper shorthand (finds gradlew in current or parent directory)
gw() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -x "$dir/gradlew" ]]; then
      "$dir/gradlew" "$@"
      return $?
    fi
    dir="$(dirname "$dir")"
  done
  command gradle "$@"
}

# Terminal Toys Menu
toys() {
  cat << 'EOF' | lolcat -F 0.3
  ╔═══════════════════════════════════════════════════════════╗
  ║                      🎮 TERMINAL TOYS                     ║
  ╚═══════════════════════════════════════════════════════════╝
EOF
  echo -e "\033[1;36m1. sl\033[0m            Steam locomotive chugs across your screen"
  echo -e "   \033[90mUsage: sl\033[0m"
  echo -e "\033[1;36m2. asciiquarium\033[0m  Full-screen animated underwater aquarium"
  echo -e "   \033[90mUsage: asciiquarium  (press 'q' to quit)\033[0m"
  echo -e "\033[1;36m3. fortune\033[0m       Random witty quotes, jokes, and proverbs"
  echo -e "   \033[90mUsage: fortune | lolcat\033[0m"
  echo -e "\033[1;36m4. figlet\033[0m        Generate giant ASCII banner text"
  echo -e "   \033[90mUsage: figlet \"Hello\" | lolcat\033[0m"
  echo -e "\033[1;36m5. lolcat\033[0m        Colorize any command output in rainbows"
  echo -e "   \033[90mUsage: <any-command> | lolcat\033[0m"
  echo ""
  echo -e "\033[3mTry running: fortune | lolcat\033[0m"
}

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias claude='~/.claude/launcher.sh'

# eza (Modern ls with icons)
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons=auto --group-directories-first"
  alias ll="eza -la --icons=auto --group-directories-first --git"
  alias lt="eza --tree --level=2 --icons=auto"
fi

# bat (Modern cat with syntax highlighting)
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --paging=never --style=plain"
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
