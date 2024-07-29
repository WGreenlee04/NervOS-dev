{ ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ./_systems/workstation.nix
    ../users/wg.nix
  ];

  modules.nvidia.enable = true;
  modules.steam.enable = true;
  boot.loader.grub.device = "/dev/disk/by-uuid/848C-520C";
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}
