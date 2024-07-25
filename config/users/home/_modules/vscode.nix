{ pkgs, config, lib, ... }:

{
  options = {
    modules.vscode.enable = lib.mkEnableOption "vscode";
  };

  config = lib.mkIf config.modules.vscode.enable {
    home.packages = [ pkgs.nixpkgs-fmt ];
    programs.vscode = {
      enable = true; # temporary text editor
      extensions = [ pkgs.vscode-extensions.jnoortheen.nix-ide ];
    };
  };
}