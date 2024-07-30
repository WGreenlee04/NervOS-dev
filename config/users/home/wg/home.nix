{ pkgs, config, ... }:

let
  assets = ./_assets;
  wallpapers = [
    "${assets}/1.png"
    "${assets}/2.png"
    "${assets}/3.jpg"
    "${assets}/4.png"
    "${assets}/5.jpg"
  ];
in
{
  imports = [
    ../_modules
  ];

  modules = {
    btop.enable = true;
    fastfetch.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    git.enable = true;
    hyprland = {
      enable = true;
      wallpapers = wallpapers;
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
