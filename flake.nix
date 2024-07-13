{
  description = "A clean, modular, extensible NixOS config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... } @ inputs: 
  let
    # Function for constructing systems from components.
    mksys = import ./lib/mksys.nix inputs;
  in {  
    # Special entrypoint for nixos rebuild --flake
    nixosConfigurations = {
      battleship = mksys "battleship" {
        user = "wg"; # TODO: make this a list
      };
    };
  };
}
