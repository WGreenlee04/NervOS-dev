{ config, lib, ... }:

let
  cfg = config.modules.steam;
in
{
  options.modules.steam = {
    enable = lib.mkEnableOption "steam";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true; # steam is unfree

    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
    };

    hardware.steam-hardware.enable = true;
  };
}
