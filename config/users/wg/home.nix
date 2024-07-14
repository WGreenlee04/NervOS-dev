{ pkgs, config, ... }:

{
  # Basic information
  home = {
    username = "wg";
    homeDirectory = "/home/wg";
    stateVersion = "24.05";
  };

  # Packages
  home.packages = [
    pkgs.btop
    pkgs.fastfetch
    pkgs.nnn
  ];

  # Program Config
  programs = {
    home-manager.enable = true;
    firefox.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.path = "$HOME/.cache/zsh_history";
      shellAliases = {
        ll = "ls -la";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" ];
      };
    };
    starship.enable = true; # shell theme
    neovim = {
      enable = true;
    };
  };
}