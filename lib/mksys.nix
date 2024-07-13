inputs: name: { user }:

let
  # The config modules for this system.
  common = ./common.nix; # common config for all systems
  hostModule = ../hosts/${name}/host.nix; # for host level config (including hardware)
  userModule = ../users/${user}/user.nix; # for user level config
  hmModule = ../users/${user}/home.nix; # for home level config

  # How to construct the system
  # Abstracted in case these need to change later.
  os = inputs.nixpkgs.lib.nixosSystem;
  hm = inputs.home-manager.nixosModules.home-manager;
in os {
  modules = [
    common
    hostModule
    userModule
    hm {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user} = import hmModule; # this method makes home manager reusable
      };
    }
  ];
}