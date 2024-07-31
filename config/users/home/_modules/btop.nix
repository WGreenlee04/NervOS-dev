{ config, lib, ... }:

let
  cfg = config.modules.btop;
in
{
  options.modules.btop = {
    enable = lib.mkEnableOption "btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true; # system resource viewer
      settings = {
        #* Name of a btop++/bpytop/bashtop formatted ".theme" file, "Default" and "TTY" for builtin themes.
        #* Themes should be placed in "../share/btop/themes" relative to binary or "$HOME/.config/btop/themes"
        color_theme = "gruvbox_dark";

        #* If the theme set background should be shown, set to false if you want terminal background transparency.
        theme_background = false;

        #* Manually set which boxes to show. Available values are "cpu mem net proc" and "gpu0" through "gpu5", separate values with whitespace.
        shown_boxes = "proc cpu mem net gpu0";

        #* Show processes as a tree.
        proc_tree = true;

        #* Use a darkening gradient in the process list.
        proc_gradient = false;

        #* Optional filter for shown disks, should be full path of a mountpoint, separate multiple values with whitespace " ".
        #* Begin line with "exclude=" to change to exclude filter, otherwise defaults to "most include" filter. Example: disks_filter="exclude=/boot /home/user".
        disks_filter = "exclude=/boot";

        #* Show swap as a disk, ignores show_swap value, inserts itself after first disk.
        swap_disk = false;
      };
    };
  };
}
