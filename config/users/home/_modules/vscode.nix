{ pkgs, config, lib, ... }:

let
  cfg = config.modules.vscode;
in
{
  options.modules.vscode = {
    enable = lib.mkEnableOption "vscode";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.nixpkgs-fmt ];
    programs.vscode = {
      enable = true; # temporary text editor
      extensions = [ pkgs.vscode-extensions.jnoortheen.nix-ide ]; # nix editor extension
      userSettings = {
        "editor.formatOnSave" = "true"; # use the nixfmt formatter on save
      };
    };
  };
}
