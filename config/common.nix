{ pkgs, lib, ... }:

{
  # Custom options
  options = {
    global = {
      gaming.enable = lib.mkEnableOption "gaming on this host";
    };
  };

  # Common config
  config = {
    nix = {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        flake-registry = "";
      };
      channel.enable = false;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
    
    environment = {
      systemPackages = [ pkgs.git ]; # need git to manage this config
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
