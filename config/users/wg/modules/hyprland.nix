{ pkgs, config, lib, ... }:

{
  options = {
    modules.hyprland.enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf config.modules.hyprland.enable {
    home.packages = [
      pkgs.hyprpicker # color picker for hyprland
      pkgs.libsForQt5.polkit-kde-agent # elevation agent
      pkgs.kdePackages.dolphin # file manager
    ];

    programs = {
      hyprlock.enable = true; # hyprland lock screen
      kitty = {
        enable = true; # hyprland default terminal emulator
        settings = {
          shell = "zsh";
        };
      };
      waybar.enable = true; # system taskbar
    };

    services = {
      hyprpaper = {
        enable = true; # wallpaper manager
        settings = {
          preload = ../assets/wg-home.jpg;
          wallpaper = ",${../assets/wg-home.jpg}";
        };
      };
      # hypridle.enable = true; # idle daemon to put pc to sleep
      mako.enable = true; # notification manager
    };

    # Hyprland config
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor="DP-1,1920x1080@144,0x0,1";
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$taskbar" = "waybar";
        exec-once = [ "$taskbar" "mako" "hyprpaper" ];
        general = {
          gaps_in="8";
          gaps_out="15";
          border_size="5";
          col.active_border = "rgba(edd1f5e7)";
          col.inactive_border = "rgba(3422435a)";
          resize_on_boarder = "true";
          extend_border_grab_area = "10";
        };
        decoration = {
          rounding = "15";
          shadow_range = "10";
          shadow_render_power = "4";
          blur = {
            xray = "true";
            size = "12";
            passes = "4";
          };
        };
        animations = {
          enabled = "true";
          bezier = "quart, 0.25, 1, 0.5, 1";
          animation = [ "windows, 1, 6, quart, slide" "border, 1, 6, quart" "borderangle, 1, 6, quart" "fade, 1, 6, quart" "workspaces, 1, 6, quart" ];
        };

        dwindle = {
            pseudotile = "true";
            preserve_split = "true";
        };
        master = {
          new_is_master = "true";
        };
        misc = { 
          disable_hyprland_logo = "true";
        };
        input = {
          kb_layout = us;
        };

        # KEYBINDS #
        "$mainMod" = "SUPER";
        "$shiftMod" = "SHIFT";

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = [ 
          "$mainMod, Q, exec, $terminal"
          "$mainMod, C, killactive,"
          "$mainMod, ESC, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          #"$mainMod, D, exec, $menu"
          "$mainMod, P, pseudo," # dwindle
          "$mainMod, J, togglesplit", # dwindle

          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod $shiftMod, 1, movetoworkspace, 1"
          "$mainMod $shiftMod, 2, movetoworkspace, 2"
          "$mainMod $shiftMod, 3, movetoworkspace, 3"
          "$mainMod $shiftMod, 4, movetoworkspace, 4"
          "$mainMod $shiftMod, 5, movetoworkspace, 5"
          "$mainMod $shiftMod, 6, movetoworkspace, 6"
          "$mainMod $shiftMod, 7, movetoworkspace, 7"
          "$mainMod $shiftMod, 8, movetoworkspace, 8"
          "$mainMod $shiftMod, 9, movetoworkspace, 9"
          "$mainMod $shiftMod, 0, movetoworkspace, 10"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod $shiftMod, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ];

        
        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        windowrulev2 = "suppressevent maximize, class:.*";
      };
    };
  };
}