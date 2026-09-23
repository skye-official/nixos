{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./locale.nix
    ./nix.nix
    ./services.nix
    ./systemd-boot.nix
    ./userenv.nix
  ];

  system.stateVersion = "26.11";
}
