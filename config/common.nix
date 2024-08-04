{ pkgs, lib, ... }:

{
  nix = {
    settings = {
      max-jobs = "auto";
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
