inputs:

let
  systems = import ../config/hosts.nix;
  lib = inputs.nixpkgs.lib;

  # Config modules
  home-manager = inputs.home-manager.nixosModules.home-manager;
  agenix = inputs.agenix.nixosModules.age;
  common = ../config/common.nix;
  syscfg = sys: import ../config/hosts/${sys}.nix;
in
lib.attrsets.genAttrs systems (system: 
  lib.nixosSystem {
    modules = [
      home-manager
      agenix
      common
      (syscfg system)
    ];
  }
)