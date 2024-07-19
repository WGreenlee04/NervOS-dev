{ pkgs, config, ... }:

{
  imports = [
    ./modules/default.nix
  ];

  modules = {
    steam.enable = true;
  };
  
  # User setup
  users.users.wg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] 
    ++ (if config.networking.networkmanager.enable then [ "networkmanager" ] else []);
    initialPassword = "";
  };

  # Home Manager
  home-manager.users.wg = import ./wg/home.nix;
}
