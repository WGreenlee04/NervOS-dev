{ config, lib, ... }:

{
  options = {
    modules.networking.enable = lib.mkEnableOption "networking";
  };

  config = lib.mkIf config.modules.networking.enable {
    networking = {
      networkmanager.enable = true;
    };
  };
}
