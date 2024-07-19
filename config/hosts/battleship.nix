{ ... }:

{
  imports = [
    ./modules/default.nix
    ./battleship/hardware-configuration.nix
    ../systems/workstation.nix
    ../users/wg.nix
  ];

  modules.nvidia.enable = true;
  global.gaming.enable = true;
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}
