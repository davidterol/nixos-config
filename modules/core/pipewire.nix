{ pkgs, ... }:
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # lowLatency.enable = true;
    wireplumber.extraConfig = {
    "override.monitor.bluez.properties" = {
      "bluez5.enable-msbc" = false;
      "bluez5.hfphsp-backend" = "none";
      "bluez5.roles" = [
        "a2dp_sink"
        "a2dp_source"
      ];
    };
  };
  };
	#  services.pipewire.wireplumber.extraConfig."11-bluetooth-policy" = {
	#  	"wireplumber.settings" = {
	#  	  "bluetooth.autoswitch-to-headset-profile" = false;
	#  		};
	# };
services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
  "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" "a2dp_sink" ];
  };
};
  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
hardware.bluetooth = {
    # https://nixos.wiki/wiki/Bluetooth
    enable = true;
    # powerOnBoot = false;
    settings.General.Experimental = true; # bluetooth battery percentage
    settings = {
      General =  {
        Enable="Source,Sink,Media,Socket ";
        };
    };
  };
  services.blueman.enable = true;
}
