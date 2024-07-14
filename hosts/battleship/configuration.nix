{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../.prefabs/workstation.nix
    ../../users/wg.nix
  ];

  gaming = true;
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}