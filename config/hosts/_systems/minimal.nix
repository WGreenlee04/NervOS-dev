{ ... }:

{
  imports = [
    ../_modules
  ];

  modules = {
    boot.enable = true;
    networking.enable = true;
  };
}