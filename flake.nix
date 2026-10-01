{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
  };

  outputs = { nixpkgs, ... }: {
    nixosConfigurations = {
      myNixOS = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };
}
