{ pkgs, config, lib, ... }:

{
  # User setup
  users.users.wg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] 
    ++ lib.optionals config.networking.networkmanager.enable [ "networkmanager" ];
    initialPassword = "";
  };

  # Home Manager
  home-manager.users.wg = ./wg/home.nix;
}
