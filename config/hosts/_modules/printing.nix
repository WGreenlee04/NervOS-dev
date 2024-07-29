{ config, lib, ... }:

let
  cfg = config.modules.printing;
in
{
  options.modules.printing = {
    enable = lib.mkEnableOption "printing";
  };

  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true; # printing support with CUPS
      cups-pdf.enable = true; # enables print-to-pdf
      browsing = true; # ability to see network printers
    };
  };
}
