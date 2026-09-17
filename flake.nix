{
  description = "My NixOS on panasonic-cfsv8";

  inputs = {
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      myNixOS-panasonic = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./config/configuration.nix ];
      };
    };
  };
}
