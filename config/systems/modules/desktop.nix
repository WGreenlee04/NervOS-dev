{ pkgs, ... }:

{
  options = {
    modules.desktop.enable = mkEnableOption "the desktop environment";
  };
  
  config = mkif modules.desktop.enable {
    environment.systemPackages = [
      pkgs.kitty # hyprland's default terminal emulator
      pkgs.sddm-chili-theme # theme for sddm
    ];

    programs = {
      hyprland.enable = true; # wayland compositor
      hyprlock.enable = true; # hyprland lock screen
    };

    services = {
      displayManager = {
        sddm = { # login screen. uses a different compositor, but works
          enable = true;
          wayland.enable = true;
          theme = "chili";
        };
      };
    };
  };
}