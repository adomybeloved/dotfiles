{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  environment.systemPackages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
      winDecStyles = [ "modern" ];
    })
    (catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "mauve";
    })
    (catppuccin-gtk.override {
      accents = [ "mauve" ];
      size = "standard";
      variant = "mocha";
    })
    (catppuccin-kvantum.override {
      accent = "mauve";
    })
    catppuccin-cursors.mochaMauve
    catppuccin-cursors.mochaDark
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "mauve";
    sddm.enable = true;
  };
}
