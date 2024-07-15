{ pkgs, ... }:

let
  assets = import ./workstation/assets.nix;
in
{
  boot = {
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = [
    pkgs.kitty # hyprland's default terminal emulator
    pkgs.sddm-chili-theme # theme for sddm
  ];

  networking = {
    networkmanager.enable = true;
  };

  programs = {
    hyprland.enable = true; # wayland compositor
    hyprlock.enable = true; # hyprland lock screen
    waybar.enable = true; # wayland taskbar
  };

  security = {
    rtkit.enable = true; # needed for pipewire
  };

  services = {
    printing.enable = true; # printing
    pipewire = { # audio and bluetooth
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.extraConfig = { # bluetooth
        "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };
    };
    displayManager = {
      defaultSession = "hyprland"; # ensures sddm logs into hyprland
      sddm = { # login screen. uses a different compositor, but works
        enable = true;
        wayland.enable = true;
        theme = "sddm-chili-theme";
      };
    };
  };
}