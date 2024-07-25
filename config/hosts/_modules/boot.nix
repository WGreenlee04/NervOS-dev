{ config, lib, ... }:

{
  options = {
    modules.boot.enable = lib.mkEnableOption "booting";
  };

  config = lib.mkIf config.modules.boot.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
