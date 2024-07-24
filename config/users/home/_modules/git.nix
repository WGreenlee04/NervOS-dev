{ config, lib, ... }:

{
  options = {
    modules.git.enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf config.modules.git.enable {
    programs.git.enable = true; # version control
  };
}