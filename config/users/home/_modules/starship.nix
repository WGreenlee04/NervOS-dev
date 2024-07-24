{ config, lib, ... }:

{
  options = {
    modules.starship.enable = lib.mkEnableOption "starship";
  };

  config = lib.mkIf config.modules.starship.enable {
    programs.starship.enable = true; # shell theme
  };
}