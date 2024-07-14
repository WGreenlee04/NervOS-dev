inputs:

let
  systems = import ../hosts/hosts.nix;
  lib = inputs.nixpkgs.lib;

  # Config modules
  home-manager = inputs.home-manager.nixosModules.home-manager;
  common = ./common.nix;
in
lib.attrsets.genAttrs systems (system: 
  lib.nixosSystem {
    modules = [
      home-manager
      common
      ../hosts/${system}/configuration.nix
    ];
  }
)