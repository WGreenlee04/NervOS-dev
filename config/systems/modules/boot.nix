{ ... }:

{
  options = {
    modules.boot.enable = mkEnableOption "booting";
  };

  config = mkif modules.boot.enable {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };
  };
}