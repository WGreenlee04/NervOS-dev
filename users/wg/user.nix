{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true; # user uses unfree packages
 
  programs = {
    fish.enable = true; # user depends on fish for shell
    steam = { # easiest way to install steam
      enable = true;
      remotePlay.openFirewall = true; # open ports for Steam Remote Play
      dedicatedServer.openFirewall = true; # open ports for Source Dedicated Server
    };
  };
 
  users.users.wg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] 
    ++ (if config.networking.networkmanager.enable then [ "networkmanager" ] else []);
    shell = pkgs.fish;
    initialPassword = "";
  };
}