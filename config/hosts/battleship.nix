{ ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ./.modules/nvidia.nix
    ../systems/workstation.nix
    ../users/wg.nix
  ];

  gaming = true;
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}