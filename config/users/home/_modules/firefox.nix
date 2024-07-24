{ config, lib, ... }:

{
  options = {
    modules.firefox.enable = lib.mkEnableOption "firefox";
  };

  config = lib.mkIf config.modules.firefox.enable {
    programs.firefox.enable = true; # web browser
  };
}