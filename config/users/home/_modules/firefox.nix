{ config, lib, ... }:

let
  cfg = config.modules.NAME;
in
{
  options.modules.firefox = {
    enable = lib.mkEnableOption "firefox";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox.enable = true; # web browser
  };
}
