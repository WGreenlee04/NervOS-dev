{ pkgs, lib, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      flake-registry = "";
    };
    channel.enable = false;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
  };

  environment = {
    systemPackages = [ pkgs.git ]; # need git to manage this config
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
