{ config, lib, ... }:

let
  cfg = config.modules.pipewire;
in
{
  options.modules.pipewire = {
    enable = lib.mkEnableOption "pipewire";
  };

  config = lib.mkIf cfg.enable {
    security = {
      rtkit.enable = true; # needed for pipewire
    };

    services = {
      pipewire = {
        # audio and bluetooth
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.extraConfig = {
          # bluetooth
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
          };
        };
      };
    };
  };
}
