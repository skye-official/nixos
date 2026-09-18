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
      clang-tools
      gnumake
      cmake
      cargo
      rustc
      clippy
      rustfmt
      rust-analyzer
      (jdt-language-server.override { jdk = pkgs.jdk21; })
      nil
      nixd
    ];
  };
}
