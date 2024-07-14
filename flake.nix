{
  description = "A clean, modular, extensible NixOS config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { ... } @ inputs: {
    nixosConfigurations = import ./lib/mkSystems.nix inputs;
  };
}
