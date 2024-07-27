{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.sddm-chili-theme # theme for sddm
      pkgs.kitty # QOL: ensures OS can run commands on boot with no extra config
    ];

    programs.hyprland.enable = true; # wayland compositor

    services.displayManager.sddm = {
      # login screen. uses a different compositor, but works
      enable = true;
      wayland.enable = true;
      theme = "chili";
    };
  };
}
