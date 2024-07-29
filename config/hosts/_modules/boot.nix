{ config, lib, ... }:

let
  cfg = config.modules.boot;
in
{
  options.modules.boot = {
    enable = lib.mkEnableOption "booting";
  };

  config = lib.mkIf cfg.enable {
    boot = {
      loader = {
        grub = {
          enable = true; # universal boot loader for x86
          efiSupport = true; # install as an efi bootloader
          useOSProber = true; # detect other boot options (like a Windows installation)
          splashImage = ../assets/nervos-splash.png; # appears on menu screen
          memtest86.enable = true; # add mem test as a boot option
        };
        efi.canTouchEfiVariables = true; # allows installer to change efi variables (to enable boot options)
      };
      tmp.cleanOnBoot = true; # helps cut down on disk usage, tmp is safe to clean at boot
      plymouth = {
        enable = true; # flicker-free splash screen
        logo = ../_assets/nervos-splash.png; # logo to be displayed
      };
    };
  };
}
