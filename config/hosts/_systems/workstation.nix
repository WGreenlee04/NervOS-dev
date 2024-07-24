{ ... }:

{
  imports = [
    ./minimal.nix
  ];

  modules = {
    hyprland.enable = true;
    pipewire.enable = true;
    printing.enable = true;
  };
}
