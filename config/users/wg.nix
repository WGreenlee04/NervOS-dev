{ pkgs, config, lib, ... }:

{
  imports = [
    ./modules/default.nix
  ];

  modules = {
    steam.enable = config.global.gaming.enable;
  };
  
  # User setup
  users.users.wg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] 
    ++ lib.optionals config.networking.networkmanager.enable [ "networkmanager" ];
    initialPassword = "";
  };

  # Home Manager
  home-manager.users.wg = import ./wg/home.nix;
}
