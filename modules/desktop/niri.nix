{ config, pkgs, inputs, lib, ... }:

{
  programs.niri.enable = true;

  services.displayManager.defaultSession = lib.mkForce "niri";

  programs.noctalia = {
    enable = true;
    package = inputs.noctalia.packages.${pkgs.system}.default;
    recommendedServices.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  security.polkit.enable = true;
}
