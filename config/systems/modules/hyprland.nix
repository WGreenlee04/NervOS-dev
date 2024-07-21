{ config, lib, pkgs, ... }:

{
  options = {
    modules.hyprland.enable = lib.mkEnableOption "hyprland";
  };
  
  config = lib.mkIf config.modules.hyprland.enable {
    environment.systemPackages = [ pkgs.sddm-chili-theme ]; # theme for sddm

    programs.hyprland.enable = true; # wayland compositor

    services.displayManager.sddm = { # login screen. uses a different compositor, but works
      enable = true;
      wayland.enable = true;
      theme = "chili";
    };
  };
}