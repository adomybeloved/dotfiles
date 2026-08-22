{ config, pkgs, inputs, ... }:

{
  imports = [
    ./qylock.nix
  ];

  programs.niri.enable = true;
  services.displayManager.defaultSession = "niri";

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

  environment.systemPackages = with pkgs; [
    phinger-cursors
    kanagawa-icon-theme
    adw-gtk3
    papirus-icon-theme
  ];

  security.polkit.enable = true;
}
