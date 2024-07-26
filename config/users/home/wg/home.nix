{ pkgs, config, ... }:

let
  assets = import ./assets.nix;
in
{
  imports = [
    ../_modules
  ];

  modules = {
    btop.enable = true;
    fastfetch.enable = true;
    firefox.enable = true;
    git.enable = true;
    hyprland = {
      enable = true;
      wallpapers = assets.wallpapers;
    };
    neovim.enable = true;
    starship.enable = true;
    vscode.enable = true;
    zsh.enable = true;
  };

  # Basic information
  home = {
    username = "wg";
    homeDirectory = "/home/wg";
    stateVersion = "24.05";
  };

  home.packages = [
    pkgs.unzip
  ];

  programs.home-manager.enable = true;
}
