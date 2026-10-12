{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "git+https://mirrors.nju.edu.cn/git/nixpkgs.git?ref=nixos-unstable&shallow=1";
    artcraft.url = "github:ipeglin/artcraft-nix";
    zen-broswer = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      artcraft,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        myNixOS = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            artcraft.nixosModules.default
            ./configuration.nix
          ];
        };
      };
    };
}
