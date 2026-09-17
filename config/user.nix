{ config, lib, pkgs, ... }:

{
  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    hostName = "myNixOS";
  };

  users.users.skye = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      haruna
      inkscape
      obsidian
      zed-editor
      libreoffice-stable
      kdePackages.kamoso
      kdePackages.kdenlive
      kdePackages.kjournald
      kdePackages.partitionmanager
    ];
  };

  programs = {
    nix-ld.enable = true;
    mtr.enable = true;
    git.enable = true;
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
