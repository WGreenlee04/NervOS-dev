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
  (name: user-config: lib.nixosSystem {
    modules = [
      home-manager
      agenix
      common
      user-config
      {
        # Flake specific common config
        nix = {
          registry.nixpkgs.flake = inputs.nixpkgs;
          nixPath = [ "nixpkgs=flake:nixpkgs" ];
          channel.enable = false;
          settings = {
            experimental-features = [ "nix-command" "flakes" ];
            flake-registry = "";
          };
        };
      }
    ];
  }
  )
  hosts
