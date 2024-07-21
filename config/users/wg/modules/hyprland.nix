{ config, lib, ... }:

{
  options = {
    modules.hyprland.enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf config.modules.hyprland.enable {
    home.packages = [
      pkgs.hyprpicker # color picker for hyprland
      pkgs.libsForQt5.polkit-kde-agent # elevation agent
    ];

    programs = {
      hyprlock.enable = true; # hyprland lock screen
      kitty.enable = true; # hyprland default terminal emulator
      waybar.enable = true; # system taskbar
    };

    services = {
      hyprpaper.enable = true; # wallpaper manager
      hypridle.enable = true; # idle daemon to put pc to sleep
      mako.enable = true; # notification manager
    };

    # Hyprland config
    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}