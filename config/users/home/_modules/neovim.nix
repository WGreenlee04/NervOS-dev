{ config, lib, ... }:

{
  options = {
    modules.neovim.enable = lib.mkEnableOption "neovim";
  };

  config = lib.mkIf config.modules.neovim.enable {
    programs.neovim.enable = true; # command line text editor
  };
}
