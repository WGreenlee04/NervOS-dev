{ ... }:

{
  imports = [
    ./minimal.nix
  ];

  modules = {
    desktop.enable = true;
    pipewire.enable = true;
    printing.enable = true;
  }
}
