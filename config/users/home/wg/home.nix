{ pkgs, config, ... }:

let
  assets = import ./assets.nix;
in
{
  imports = [
    ../_modules/default.nix
  ];
  
  modules = {
    hyprland.enable = true;
    vscode.enable = true;
    zsh.enable = true;
  };

  # Basic information
  home = {
    username = "wg";
    homeDirectory = "/home/wg";
    stateVersion = "24.05";
  };

  # Program Config; Takes care of any user-level setup automatically.
  programs = {
    home-manager.enable = true; # required
    btop.enable = true; # system resource viewer
    fastfetch.enable = true; # system configuration display
    firefox.enable = true; # web browser
    git.enable = true; # version control
    neovim.enable = true; # command line text editor
    starship.enable = true; # shell theme
  };
}
