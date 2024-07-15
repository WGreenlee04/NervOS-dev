{ config, ... }:

{
  imports = [
    ./battleship/hardware-configuration.nix
    ../presets/workstation.nix
    ../users/wg.nix
  ];

  gaming = true;
  # hardware.nvidia = {
  #   modesetting.enable = true; # for wayland compositors
  #   open = true; # open kernel module
  #   nvidiaSettings = true; # nvidia gui config tool
  # };
  networking.hostName = "battleship";
  system.stateVersion = "24.05";
}