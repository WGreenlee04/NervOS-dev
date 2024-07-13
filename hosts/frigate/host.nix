{ ... }:

{
  imports = [
    ./modules/hardware-configuration.nix
    ../.prefabs/workstation.nix
  ];

  # host unique information
  networking.hostName = "frigate";
  system.stateVersion = "24.05";
}