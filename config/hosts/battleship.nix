{ ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ../presets/workstation.nix
    ../users/wg.nix
  ];

  gaming = true;
  hardware.nvidia.open = true;
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}