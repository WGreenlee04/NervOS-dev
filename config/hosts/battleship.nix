{ ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ./_systems/workstation.nix
    ../users/wg.nix
  ];

  modules.nvidia.enable = true;
  modules.steam.enable = true;
  nix.settings.max-jobs = 16; # set to num cpus for building
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}
