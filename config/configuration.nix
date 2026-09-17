{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./de.nix
    ./env.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./nix.nix
    ./user.nix
  ];

  system.stateVersion = "26.11";
}
