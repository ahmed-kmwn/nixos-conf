{
  description = "My Professional NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nvf.url = "github:notashelf/nvf";
    #    polymc.url = "github:PolyMC/PolyMC";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          #          {
          #            nixpkgs.overlays = [ inputs.polymc.overlay ];
          #          }
          ./configuration.nix
          nvf.nixosModules.default
          ./nvf-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.ahmed =
              { pkgs, ... }:
              {
                imports = [
                  ./home_pack.nix
                  ./p10k.nix
                  ./shell.nix
                ];
                home.username = "ahmed";
                home.homeDirectory = "/home/ahmed";
                home.stateVersion = "25.11";
              };
          }
        ];
      };
    };
}
