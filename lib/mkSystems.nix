inputs:

let
  systems = import ../config/hosts.nix;
  lib = inputs.nixpkgs.lib;

  # Config modules
  home-manager = inputs.home-manager.nixosModules.home-manager;
  common = ../config/common.nix;
in
lib.attrsets.genAttrs systems (system: 
  lib.nixosSystem {
    modules = [
      home-manager
      common
      ../config/hosts/${system}.nix
    ];
  }
)