{ config, lib, ... }:

{
  options = {
    modules.steam.enable = lib.mkEnableOption "steam";
  };

  config = lib.mkIf config.modules.steam.enable {
    nixpkgs.config.allowUnfree = true; # steam is unfree
  
    programs = {
      steam = { # easiest way to install steam
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
    };
  };
}