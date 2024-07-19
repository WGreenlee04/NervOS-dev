{ ... }:

{
  options = {
    modules.printing.enable = mkEnableOption "printing";
  };

  config = mkif modules.printing.enable {
    services = {
      printing.enable = true; # printing
    };
  };
}