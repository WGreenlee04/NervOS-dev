{ config, lib, ... }:

{
  options = {
    modules.btop.enable = lib.mkEnableOption "btop";
  };

  config = lib.mkIf config.modules.btop.enable {
    programs.btop.enable = true; # system resource viewer
  };
}