{ config, pkgs, inputs, ... }:

{
  programs.niri.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    extraPackages = with pkgs; [
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      qt6.qtmultimedia
      qt6.qt5compat
      qt6.qtsvg
    ];
  };

  services.displayManager.defaultSession = "niri";

  programs.qylock = {
    enable = true;
    theme = "R1999_2";
    sddm.enable = true;
    quickshell.enable = true;
  };

  environment.sessionVariables = {
    GST_PLUGIN_SYSTEM_PATH_1_0 = "/run/current-system/sw/lib/gstreamer-1.0";
  };

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  programs.noctalia = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
    recommendedServices.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "mauve";
    sddm.enable = false;
  };

  environment.systemPackages = with pkgs; [
    catppuccin-cursors.mochaMauve
    catppuccin-cursors.mochaDark
    (catppuccin-gtk.override {
      accents = [ "mauve" ];
      size = "standard";
      variant = "mocha";
    })
    (catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "mauve";
    })
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    ffmpeg
  ];

  security.polkit.enable = true;
}
