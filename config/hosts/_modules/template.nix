{ config, lib, ... }:

let
  cfg = config.modules.NAME;
in
{
  options.modules.NAME = {
    enable = lib.mkEnableOption "NAME";
  };

  config = lib.mkIf cfg.enable {
    # config goes here
  };
}
