inputs:

let
  hosts = import ../config/hosts.nix;
  lib = inputs.nixpkgs.lib;

  # Config modules
  home-manager = inputs.home-manager.nixosModules.home-manager;
  agenix = inputs.agenix.nixosModules.age;
  common = ../config/common.nix;
  hostConfig = host: import ../config/hosts/${host}.nix;
in
lib.attrsets.genAttrs hosts (host: 
  lib.nixosSystem {
    modules = [
      home-manager
      agenix
      common
      (hostConfig host)
    ];
  }
)