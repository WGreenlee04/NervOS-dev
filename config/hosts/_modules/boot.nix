{ config, lib, ... }:

let
  cfg = config.modules.boot;
in
{
  options.modules.boot = {
    enable = lib.mkEnableOption "booting";
  };

  config = lib.mkIf cfg.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
