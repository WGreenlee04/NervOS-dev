{ ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ./_systems/workstation.nix
    ../users/wg.nix
  ];

  modules.nvidia.enable = true;
  modules.steam.enable = true;
  time.timeZone = "America/Louisville";
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}
