inputs:

let
  hosts = import ../config/hosts.nix;
  lib = inputs.nixpkgs.lib;

  # Config modules
  home-manager = inputs.home-manager.nixosModules.home-manager;
  agenix = inputs.agenix.nixosModules.age;
  common = ../config/common.nix;
in
builtins.mapAttrs
  (name: value: lib.nixosSystem {
    modules = [
      home-manager
      agenix
      common
      value
    ];
  }
  )
  hosts
