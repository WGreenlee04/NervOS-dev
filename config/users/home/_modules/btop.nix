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
        #* If the theme set background should be shown, set to False if you want terminal background transparency.
        theme_background = false;

        #* Sets if 24-bit truecolor should be used, will convert 24-bit colors to 256 color (6x6x6 color cube) if false.
        truecolor = true;

        #* Rounded corners on boxes, is ignored if TTY mode is ON.
        rounded_corners = true;

        #* Manually set which boxes to show. Available values are "cpu mem net proc" and "gpu0" through "gpu5", separate values with whitespace.
        shown_boxes = "proc cpu mem net gpu0";

        #* Update time in milliseconds, recommended 2000 ms or above for better sample times for graphs.
        update_ms = 1000;

        #* Show processes as a tree.
        proc_tree = true;

        #* Use the cpu graph colors in the process list.
        proc_colors = true;

        #* Use a darkening gradient in the process list.
        proc_gradient = true;

        #* Shows the system uptime in the CPU box.
        show_uptime = true;

        #* Show cpu temperature.
        check_temp = true;

        #* Show temperatures for cpu cores also if check_temp is True and sensors has been found.
        show_coretemp = true;

        #* Show CPU frequency.
        show_cpu_freq = true;

        #* Draw a clock at top of screen, formatting according to strftime, empty string to disable.
        #* Special formatting: /host = hostname | /user = username | /uptime = system uptime
        clock_format = "%H:%M";

        #* Update main ui in background when menus are showing, set this to false if the menus is flickering too much for comfort.
        background_update = true;

        #* Optional filter for shown disks, should be full path of a mountpoint, separate multiple values with whitespace " ".
        #* Begin line with "exclude=" to change to exclude filter, otherwise defaults to "most include" filter. Example: disks_filter="exclude=/boot /home/user".
        disks_filter = "exclude=/boot";

        #* Show graphs instead of meters for memory values.
        mem_graphs = true;

        #* If swap memory should be shown in memory box.
        show_swap = true;

        #* Show swap as a disk, ignores show_swap value above, inserts itself after first disk.
        swap_disk = false;

        #* If mem box should be split to also show disks info.
        show_disks = true;

        #* Set to true to show available disk space for privileged users.
        disk_free_priv = true;

        #* Toggles if io activity % (disk busy time) should be shown in regular disk usage view.
        show_io_stat = true;

        #* Show battery stats in top right if battery is present.
        show_battery = true;

        #* Which battery to use if multiple are present. "Auto" for auto detection.
        selected_battery = "Auto";

        #* Set loglevel for "~/.config/btop/btop.log" levels are: "ERROR" "WARNING" "INFO" "DEBUG".
        #* The level set includes all lower levels, i.e. "DEBUG" will show all logging info.
        log_level = "DEBUG";
      };
    };
  };
}
