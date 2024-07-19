{ ... }:

{
  options = {
    modules.networking.enable = mkEnableOption "networking";
  };

  config = mkif modules.networking.enable {
    networking = {
      networkmanager.enable = true;
    };
  };
}