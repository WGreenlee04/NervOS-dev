{ ... }:

{
  imports = [
    ./frigate/hardware-configuration.nix
    ../presets/workstation.nix
    ../users/wg.nix
  ];

  networking.hostName = "frigate";
  system.stateVersion = "24.05";
}