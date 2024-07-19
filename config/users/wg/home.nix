{ pkgs, config, ... }:

let
  assets = import ./assets.nix;
in
{
  # Basic information
  home = {
    username = "wg";
    homeDirectory = "/home/wg";
    stateVersion = "24.05";
  };

  # Packages that don't need any special wrappers
  home.packages = [
    pkgs.nnn
  ];

  # Program Config; Takes care of any user-level setup automatically.
  programs = {
    home-manager.enable = true; # required
    btop.enable = true; # system resource viewer
    fastfetch.enable = true; # system configuration display
    firefox.enable = true; # web browser
    git.enable = true; # version control
    neovim.enable = true; # command line text editor
    starship.enable = true; # shell theme
    waybar.enable = true; # system taskbar
    vscode.enable = true;
    zsh = { # shell with plugins
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.path = "$HOME/.cache/zsh_history";
      shellAliases = {
        ll = "ls -la";
      };
      oh-my-zsh = { # zsh plugin manager
        enable = true;
        plugins = [ "git" ];
      };
    };

  };
}
