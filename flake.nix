{
  description = "Personal NixOS configuration for myNixOS";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

    # artcraft = {
    #   url = "github:ipeglin/artcraft-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    deepseek-harness = {
      url = "github:Moraxyc/deepseek-harness.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;

      nixosConfigurations.myNixOS = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # inputs.artcraft.nixosModules.default
          inputs.deepseek-harness.nixosModules.default
          ./hosts/myNixOS
        ];
      };

      checks.${system}.nixosConfiguration = self.nixosConfigurations.myNixOS.config.system.build.toplevel;
    };
}
