# Handles audio/videocap/bluetooth all in one
# DOCS: https://nixos.wiki/wiki/PipeWire
{ config, lib, ... }:

let
  cfg = config.modules.pipewire;
in
{
  options.modules.pipewire = {
    enable = lib.mkEnableOption "pipewire";
  };

  config = lib.mkIf cfg.enable {
    security.rtkit.enable = true; # realtime processing for latency reduction
    services = {
      pipewire = {
        enable = true; # pipewire daemon
        alsa.enable = true; # alsa compat support
        alsa.support32Bit = true; # 32-bit (hifi) alsa support
        pulse.enable = true; # pulseaudio compat support
        jack.enable = true; # jack app support (common in low latency environments)
        wireplumber.extraConfig.bluetoothEnhancements = {
          # Magic to enable bluetooth
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
