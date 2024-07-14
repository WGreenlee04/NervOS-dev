user: { pkgs, config, ... }:

{
  # Basic information
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";
  };

  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        
      };
    };
  };

  # Packages
  home.packages = [
    pkgs.btop
    pkgs.fastfetch
    pkgs.nnn
  ];

  programs = {
    home-manager.enable = true;
    firefox.enable = true;
  };
}