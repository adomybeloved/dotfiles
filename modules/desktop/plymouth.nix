{ config, pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
    theme = "circle_alt";
    themePackages = [
      (pkgs.adi1090x-plymouth-themes.override {
        selected_themes = [ "circle_alt" ];
      })
    ];
  };

  boot.initrd.systemd.enable = true;

  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
}
