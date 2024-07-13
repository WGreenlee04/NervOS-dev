{ pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      flake-registry = "";
    };
    channel.enable = false;
  };
  
  environment.systemPackages = [ pkgs.git ]; # need git to manage this config
}