{ config, lib, pkgs, ... }:

{
  security.rtkit.enable = true;

  networking = {
    networkmanager.enable = true;
    hostName = "myNixOS-panasonic";
  };

  users.users.skye = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      haruna
      obsidian
      zed-editor
      libreoffice-stable
      kdePackages.kamoso
      kdePackages.kjournald
      kdePackages.partitionmanager
      kdePackages.plasma-thunderbolt
    ];
  };

  programs = {
    thunderbird.enable = true;
    firefox.enable = true;
    steam.enable = true;
    mtr.enable = true;
    git.enable = true;
    nix-ld.enable = true;
    yazi =
    {
      enable = true;
      package = pkgs.yazi.override { _7zz = pkgs._7zz-rar; };
    };
    zsh = {
      enable = true;
      enableCompletion = false;
    };
    java = {
      enable = true;
      package = pkgs.jdk21;
    };
  };
}
