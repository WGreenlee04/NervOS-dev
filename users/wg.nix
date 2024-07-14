{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true; # user uses unfree packages
 
  programs = {
    fish.enable = true; # user depends on fish for shell
    steam = { # easiest way to install steam
      enable = config.gaming; # enable it only if the host supports gaming
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
  
  # User setup
  users.users.wg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] 
    ++ (if config.networking.networkmanager.enable then [ "networkmanager" ] else []);
    shell = pkgs.fish;
    initialPassword = "";
  };

  # Home Manager
  home-manager.users.wg = import ./modules/wg/home.nix "wg";
}