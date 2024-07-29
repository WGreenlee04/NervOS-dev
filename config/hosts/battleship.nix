{ ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ./_systems/workstation.nix
    ../users/wg.nix
  ];

  modules.nvidia.enable = true;
  modules.steam.enable = true;
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}
