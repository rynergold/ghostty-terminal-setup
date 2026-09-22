# 👻 Ghostty + Zsh High-Performance Terminal Setup

A curated, zero-lag macOS terminal environment built for **Neovim**, powered by **Ghostty GPU acceleration**, **Antidote**, and a **pure native Zsh prompt** (~38ms launch time).

---

## ✨ Features

- **🚀 Instant Startup (~38ms):** Eliminated synchronous disk audits via 24-hour `compinit -C` caching and lazy-loaded toolchains (NVM, SDKMAN, rbenv).
- **🎨 Visual Aesthetics:** TokyoNight Moon low-contrast pastel palette with custom-framed Totoro background.
- **🪟 Window Management:** Full **Rectangle.app** snapping support with clean borderless styling and single `Option + \`` global toggle (`toggle_visibility`).
- **⚡ Neovim-Ready:** Programming ligatures enabled (`calt`, `liga`, `dlig`), seamless clipboard sharing, and block cursor alignment.
- **🌿 Pure Native Git Prompt:** Zero external binaries (0.00ms prompt render) displaying `~` home formatting and active git branch (` main*`).
- **📦 Essential Antidote Suite:** Streamlined to 3 core plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`, and `jeffreytse/zsh-vi-mode`.
- **📂 Modern CLI Aliases:** `eza` (icons + git status tree) and `bat` (syntax-highlighted cat).

---

## 📂 Repository Structure

```
.
├── ghostty/
│   ├── config                 # Ghostty config (TokyoNight, ligatures, Rectangle-ready)
│   └── totoro_custom_v2.jpg   # Tuned background wallpaper
├── zsh/
│   ├── .zshrc                 # Zero-lag Zsh configuration
│   └── .zsh_plugins.txt       # Antidote plugin bundle manifest
└── README.md
```

---

## 🛠️ Quickstart / Installation

### 1. Prerequisites (macOS / Homebrew)
```bash
brew install --cask ghostty
brew install antidote fzf zoxide eza bat
```

### 2. Fonts
Install **JetBrains Mono Nerd Font** for icons and ligatures:
```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### 3. Deploy Configs
```bash
# Ghostty config
mkdir -p ~/.config/ghostty
cp ghostty/config ~/.config/ghostty/config
cp ghostty/totoro_custom_v2.jpg ~/.config/ghostty/totoro_custom_v2.jpg

# Zsh config
cp zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
cp zsh/.zshrc ~/.zshrc

# Generate compiled plugin cache
zsh -i -c "antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh"
```

---

## ⌨️ Shortcuts & Cheatsheet

| Action | Shortcut / Command |
| :--- | :--- |
| **Toggle Terminal** | `Option` + `` ` `` |
| **History Fuzzy Search** | `Ctrl` + `R` |
| **Smart Directory Jump** | `z <folder-name>` |
| **Vim Normal Mode** | `Esc` (`w`, `b`, `ciw`, `u`) |
| **Git Shortcuts** | `gs` (status), `ga` (add), `gc` (commit), `gp` (push) |
| **Modern File Listing** | `ls` (with icons), `ll` (git details), `lt` (tree) |
| **Syntax Cat** | `cat <filename>` |

---

## 🔒 Private / Work Secrets

Any private tokens or company VPN configs can be placed in `~/.zshrc.local` (automatically sourced by `.zshrc` and kept untracked):

```bash
# ~/.zshrc.local
export MY_SECRET_TOKEN="xxx"
```
