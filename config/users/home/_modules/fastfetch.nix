{ config, lib, ... }:

{
  options = {
    modules.fastfetch.enable = lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf config.modules.fastfetch.enable {
    programs.fastfetch.enable = true; # system configuration display
  };
}