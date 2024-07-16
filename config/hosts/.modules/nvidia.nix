# DOCS: https://nixos.wiki/wiki/Nvidia
{ ... }:

{
  nixpkgs.config.allowUnfree = true; # nvidia drivers are unfree

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };

}