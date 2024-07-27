{ config, lib, ... }:

let
  cfg = config.modules.fastfetch;
in
{
  options.modules.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch.enable = true; # system configuration display
  };
}
