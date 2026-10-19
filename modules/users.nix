{ pkgs, ... }:

{
  users.users.skye = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };
}
