# NixOS Configuration

Personal NixOS configuration for **AMD Ryzen 7 8745H + RTX 4060** laptop (dual GPU, hybrid graphics).

## 🖥️ Hardware

| Component | Spec |
|-----------|------|
| CPU | AMD Ryzen 7 8745H (8C/16T, Zen 4) |
| iGPU | AMD Radeon 780M (RDNA 3) |
| dGPU | NVIDIA RTX 4060 (Ada Lovelace) |
| RAM | 14 GiB |
| Disk | 477 GB NVMe |
| OS | NixOS 26.11 (Zokor), kernel 7.2.9-zen |

## ⚙️ Key Features

### Boot & Kernel
- **systemd-boot** with 5 generation limit
- **Zen kernel** (`linuxPackages_zen`) for low latency
- **Plymouth** splash (`nixos-bgrt` theme)
- **zram swap** (zstd, 100% memory)

### Graphics (Hybrid/Prime Offload)
- **AMD iGPU** (amdgpu) as primary
- **NVIDIA dGPU** (open kernel module, nvidia-vaapi-driver)
- **Prime offload**: `prime-run` / `__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia`
- Bus IDs explicitly configured (AMD: PCI:5:0:0, NVIDIA: PCI:1:0:0)

### Desktop Environment
- **KDE Plasma 6** (Wayland)
- **SDDM** display manager
- **PipeWire** (Pulse, JACK, ALSA)
- **fcitx5** input method (Chinese)

### Shell & CLI
- **zsh** with carefully ordered plugins:
  1. fzf (completion + key-bindings)
  2. **fzf-tab** (must load before autosuggestions/syntax-highlighting)
  3. zsh-autosuggestions (highlight: `fg=#888888`)
  4. zsh-history-substring-search
  5. **fast-syntax-highlighting** (last)
- **Starship** prompt (catppuccin-powerline preset)
- **eza**, **bat**, **fd**, **rg**, **btop**, **helix** (editor)
- **direnv** via `zsh-autoenv`

### Development Tools
- **LLVM/Clang** toolchain
- **Rust** (cargo, rustc, clippy, rustfmt, rust-analyzer, slint-lsp)
- **Java 21** (JDK, jdt-language-server)
- **Node.js** via nixpkgs (nil, nixd, bash-language-server)
- **Helix** editor, **Obsidian**, **LibreOffice**

### Virtualization
- **libvirtd** + **virt-manager**
- Network bridge `virbr0` trusted in firewall

### Nix Configuration
- Flakes + `nix-command` enabled
- Chinese mirrors (SJTU, USTC, TUNA)
- `auto-optimise-store`, `fallback`, 5s connect timeout
- `nix-ld` for dynamic linking compatibility
- `deepseek-harness` module integrated

## 📁 Structure

```
.
├── configuration.nix      # Main system configuration
├── flake.nix              # Flake entry point
├── flake.lock             # Locked dependencies
├── hardware-configuration.nix  # Hardware-specific (generated, not tracked)
└── README.md              # This file
```

## 🚀 Usage

### Initial Setup
```bash
# Clone to /etc/nixos (or symlink)
git clone <this-repo> /etc/nixos
cd /etc/nixos

# Generate hardware config (first time only)
nixos-generate-config --show-hardware-config > hardware-configuration.nix

# Build & switch
sudo nixos-rebuild switch --flake .#myNixOS
```

### Daily Updates
```bash
cd /etc/nixos
git pull
sudo nixos-rebuild switch --flake .
```

### Rollback
```bash
sudo nixos-rebuild switch --rollback
# Or select previous generation in systemd-boot menu
```

### NVIDIA Offload
```bash
# Run app on dGPU
prime-run <app>
# Or manually
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia <app>
```

## 🔧 Customization Notes

- **Hostname**: `myNixOS` (change in `networking.hostName`)
- **User**: `skye` (wheel + libvirtd groups)
- **Timezone**: Asia/Shanghai
- **Editor**: `hx` (Helix) via `EDITOR` env
- **Fonts**: Noto CJK + Nerd Font (Code New Roman)
- **GPU**: Adjust `amdgpuBusId` / `nvidiaBusId` if PCI topology differs

## 📦 External Inputs

| Input | Source | Purpose |
|-------|--------|---------|
| nixpkgs | github:NixOS/nixpkgs/nixos-26.11 | Base packages |
| zen-browser | github:youwen5/zen-browser-flake | Zen Browser |
| artcraft | github:ipeglin/artcraft-nix | Font rendering |
| deepseek-harness | github:moraxyc/deepseek-harness.nix | AI harness module |

## 📝 License

Personal configuration — no warranty, use at your own risk.