{ pkgs, ... }:

{
  users.users.skye = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

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
      nil
      nixd
      (jdt-language-server.override { jdk = pkgs.jdk21; })

      gimp
      krita
      haruna
      inkscape
      obsidian
      zed-editor
      libreoffice-stable
      kdePackages.kcalc
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.kjournald
      kdePackages.partitionmanager
    ];
  };

  programs = {
    nix-ld.enable = true;
    mtr.enable = true;
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "skye-official";
          email = "skye_official@163.com";
        };
      };
    };
    yazi = {
      enable = true;
      package = pkgs.yazi.override {
        _7zz = pkgs._7zz-rar;
      };
    };
    zsh = {
      enable = true;
      enableCompletion = false;
    };
    java = {
      enable = true;
      package = pkgs.jdk21;
    };
    thunderbird.enable = true;
    firefox.enable = true;
    steam.enable = true;
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-vaapi
      ];
    };
  };
}
