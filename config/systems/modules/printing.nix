{ config, lib, ... }:

{
  options = {
    modules.printing.enable = lib.mkEnableOption "printing";
  };

  config = lib.mkIf config.modules.printing.enable {
    services = {
      printing.enable = true; # printing
    };
  };
}