{
  description = "My personal MacOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nix-darwin, home-manager, nix-homebrew, ... }@inputs:
  let
    username = "chris";
    email = "chrisdawson1996@gmail.com";
    system = "aarch64-darwin";
    hostname = "chris-mbp";

    specialArgs = inputs // { 
      inherit username email hostname system;
    };
  in
  {
    darwinConfigurations."personal" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;

      modules = [
        ./modules/apps.nix
        ./modules/users.nix
        ./modules/nix-core.nix
        ./modules/system.nix

        nix-homebrew.darwinModules.nix-homebrew
        ./modules/nix-homebrew.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./home;
        }
      ];
    };
  };
}
