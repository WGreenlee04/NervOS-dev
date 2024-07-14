{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../.prefabs/workstation.nix
    ../../users/wg.nix
  ];

  networking.hostName = "frigate";
  system.stateVersion = "24.05";
}