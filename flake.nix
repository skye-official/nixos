{
  description = "My NixOS";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
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
