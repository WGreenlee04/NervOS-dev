# DOCS: https://nixos.wiki/wiki/Nvidia
{ config, lib, ... }:

let
  cfg = config.modules.nvidia;
in
{
  options.modules.nvidia = {
    enable = lib.mkEnableOption "nvidia";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true; # nvidia drivers are unfree

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true; # necessary for wayland
      powerManagement.enable = false; # unstable
      powerManagement.finegrained = false; # unstable
      open = true; # open kernel module, in alpha
      nvidiaSettings = true; # settings menu accessible in OS
    };
  };

}
