{ config, lib, pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "hx";
    };

    systemPackages = with pkgs; [
      nvtopPackages.full
      wl-clipboard
      fastfetch
      nix-tree
      pstree
      yt-dlp
      darkly
      helix
      tree
      wget
      bind
      btop
      fzf

      clang
      cmake
      gnumake
      rustc
      cargo
      clippy
      rustfmt
      rust-analyzer
      nil
      nixd
    ];
  };
}
