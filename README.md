# Ghostty + Zsh Terminal Setup

A macOS terminal configuration using Ghostty and Zsh, tuned for fast startup (~38ms) and Neovim workflows.

---

## Highlights

- **Fast startup:** Uses 24-hour `compinit -C` caching and lazy-loads heavy toolchains (NVM, SDKMAN, rbenv) so new shells open in under 40ms.
- **TokyoNight Moon palette:** Low-contrast theme with a framed Totoro background.
- **Window management:** Borderless window with Rectangle snapping support and an `Option + \`` visibility toggle.
- **Neovim integration:** Enables font ligatures (`calt`, `liga`, `dlig`), system clipboard sharing, and block cursor styling.
- **Lightweight prompt:** Pure native Zsh prompt showing the current directory and Git branch (`path | branch`) with 0.00ms overhead without external binary dependencies.
- **Antidote plugins:** Kept minimal with `zsh-vi-mode` for modal Vim command-line editing.
- **Modern CLI defaults:** Aliases for `eza` and `bat`.

---

## File Layout

```
.
├── ghostty/
│   ├── config                 # Ghostty settings (theme, keybinds, ligatures)
│   └── totoro_custom_v2.jpg   # Background wallpaper
├── zsh/
│   ├── .zshrc                 # Shell configuration and lazy-loaders
│   └── .zsh_plugins.txt       # Antidote plugin list
└── README.md
```

---

## Installation

### 1. Requirements
```bash
brew install --cask ghostty
brew install antidote fzf zoxide eza bat
brew install --cask font-jetbrains-mono-nerd-font
```

### 2. Copy Configs
```bash
# Ghostty
mkdir -p ~/.config/ghostty
cp ghostty/config ~/.config/ghostty/config
cp ghostty/totoro_custom_v2.jpg ~/.config/ghostty/totoro_custom_v2.jpg

# Zsh
cp zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
cp zsh/.zshrc ~/.zshrc

# Silence login banner
touch ~/.hushlogin

# Compile plugins
zsh -i -c "antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh"
```

---

## Keybinds and Aliases

| Action | Shortcut / Command |
| :--- | :--- |
| Toggle terminal visibility | `Option + \`` |
| Fuzzy history search | `Ctrl + R` |
| Directory jump | `z <folder>` |
| Vim normal mode | `Esc` (`w`, `b`, `ciw`, `u`) |
| Git shortcuts | `gs`, `ga`, `gc`, `gp` |
| File list with icons | `ls`, `ll`, `lt` |
| Syntax-highlighted view | `cat <file>` |
