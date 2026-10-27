{ pkgs, ... }:

{
  environment = {
    variables.EDITOR = "hx";

    systemPackages = with pkgs; [
      # Shell and command-line utilities
      wl-clipboard
      nvtopPackages.full
      nix-tree
      btop
      fastfetch
      ripgrep
      eza
      fzf
      bat
      fd

      # Network and media
      dnsmasq
      yt-dlp
      wget

      # Editors and development tools
      helix
      clang
      clang-tools
      gnumake
      cmake
      cargo
      rustc
      clippy
      rustfmt
      rust-analyzer
      slint-lsp
      slint-viewer
      jdt-language-server
      nil
      nixd
      bash-language-server

      # Desktop applications
      haruna
      obsidian
      libreoffice-qt
      gimp-with-plugins
      inkscape-with-extensions

      # KDE utilities
      kdePackages.kcalc
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.kjournald
      kdePackages.filelight
      kdePackages.partitionmanager
    ];
  };
}
