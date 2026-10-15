# NixOS Configuration for Panasonic CF-SV8

Personal NixOS configuration for **Panasonic Let's Note CF-SV8** (Intel i5-8365U, 8GB RAM).

## System Overview

| Component | Choice |
|-----------|--------|
| **Hostname** | `myNixOS-panasonic` |
| **Kernel** | `linuxPackages_zen` (Zen kernel) |
| **Bootloader** | systemd-boot (UEFI) |
| **Desktop** | KDE Plasma 6 (Wayland) |
| **Display Manager** | SDDM |
| **Shell** | zsh + Starship (catppuccin-powerline) |
| **Input Method** | fcitx5 (Chinese/Japanese) |
| **Fonts** | Noto CJK, Nerd Fonts (CodeNewRoman) |

## Key Features

### Zsh Configuration (`programs.zsh`)
- **Completion**: Enabled with `zsh-completions`
- **Plugins** (loaded in order):
  - `fzf` — fuzzy finder (completion + key bindings)
  - `zsh-fzf-tab` — fzf-powered tab completion menu
  - `zsh-autosuggestions` — gray inline suggestions from history
  - `zsh-history-substring-search` — ↑/↓ search history by typed prefix
  - `zsh-fast-syntax-highlighting` — fast syntax highlighting
- **Key Bindings**:
  - `Ctrl+←/→` — word jump (backward-word/forward-word)
  - `↑/↓` — history substring search (match current input)
  - `Ctrl+R` — fzf history search
- **Visual**: Region highlight (selection) matches autosuggestion color (`fg=8`)

### Aliases (modern replacements)
```bash
l   = eza -alh --icons --git
ll  = eza -lh --icons --git
ls  = eza --icons --git
cat = bat
tree = eza --tree
find = fd --color=auto
grep = rg --color=auto
diff = diff --color=auto
```

### System Packages
- **Development**: clang, cmake, rust (cargo, rustc, rust-analyzer), jdt-ls, nil, nixd, bash-language-server, slint-lsp
- **Monitoring**: btop, nvtop, fastfetch, nix-tree
- **Media**: haruna, obsidian, libreoffice-qt, kde apps (kcalc, kamoso, kjournald, filelight, partitionmanager)
- **Utilities**: yt-dlp, wl-clipboard, wget, helix editor
- **Browser**: Zen Browser (via flake input)

### Hardware & Power
- **Graphics**: Intel i915 + intel-media-driver + vpl-gpu-rt
- **Bluetooth**: Enabled, power on boot
- **Power Management**: TLP (with `tlp-pd` for USB-C PD)
- **Swap**: zram (zstd, 100% memory)
- **Plymouth**: nixos-bgrt theme (quiet boot)

### Nix Configuration
- **Channels**: Disabled (flake-only)
- **Substituters**: SJTU, USTC, TUNA mirrors
- **Experimental Features**: `nix-command`, `flakes`
- **Auto-optimise Store**: Enabled

## Flake Inputs
- `nixpkgs` — nixos-26.11
- `deepseek-harness` — `github:moraxyc/deepseek-harness.nix` (NixOS module)

## Usage

### Rebuild System
```bash
sudo nixos-rebuild switch --flake .#panasonic
```

### Update Flake Inputs
```bash
nix flake update
```

### Garbage Collect
```bash
sudo nix-collect-garbage -d
```

## Machine-Specific Notes
- **Keyboard**: Japanese layout (JIS)
- **Timezone**: Asia/Shanghai
- **Console Font**: Terminus `ter-u28n` (large for HiDPI)
- **Hardware Config**: `hardware-configuration.nix` is **not tracked** (generated per machine)

## Directory Structure
```
.
├── configuration.nix      # Main system configuration
├── flake.nix              # Flake entry point
├── flake.lock             # Locked inputs
├── hardware-configuration.nix  # Machine-specific (gitignored)
└── README.md              # This file
```