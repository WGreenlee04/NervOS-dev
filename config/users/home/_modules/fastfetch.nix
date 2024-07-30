{ config, lib, ... }:

let
  cfg = config.modules.fastfetch;
in
{
  options.modules.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true; # system configuration display
      settings = {
        logo = {
          padding = {
            top = 2; # center the logo vertically
          };
        };
        modules = [
          # components of the output
          "title"
          "separator"
          "os"
          "bootmgr"
          "kernel"
          "initsystem"
          "uptime"
          "processes"
          "packages"
          "shell"
          "display"
          "monitor"
          "lm"
          "de"
          "wm"
          "wmtheme"
          "theme"
          "icons"
          "font"
          "cursor"
          "terminal"
          "terminalfont"
          "terminaltheme"
          "player"
          "media"
          "users"
          "version"
          "break"
          "colors"
        ];
      };
    };
  };
}
