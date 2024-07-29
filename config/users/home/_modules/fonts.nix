{ pkgs, config, lib, ... }:

let
  cfg = config.modules.fonts;
in
{
  options.modules.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true; # allow font package discovery from home.packages

    home.packages = [
      pkgs.fira-code
      pkgs.fira-code-symbols
      pkgs.font-awesome
      pkgs.nerdfonts
      pkgs.noto-fonts
      pkgs.noto-fonts-emoji
      pkgs.proggyfonts
    ];
  };
}
