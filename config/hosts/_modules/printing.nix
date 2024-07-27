{ config, lib, ... }:

let
  cfg = config.modules.printing;
in
{
  options.modules.printing = {
    enable = lib.mkEnableOption "printing";
  };

  config = lib.mkIf cfg.enable {
    services = {
      printing.enable = true;
    };
  };
}
