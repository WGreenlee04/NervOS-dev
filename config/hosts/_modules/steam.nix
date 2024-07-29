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
        enable = true; # install steam
        remotePlay.openFirewall = true; # open ports for remote play
        dedicatedServer.openFirewall = true; # open ports for steam server
        localNetworkGameTransfers.openFirewall = true; # open ports for local transfers
      };
    };

    hardware.steam-hardware.enable = true; # support for valve hardware (steam controller/valve index)
  };
}
