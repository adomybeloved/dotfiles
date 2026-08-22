{ config, pkgs, ... }:

{
  imports = [
    ./shell
    ./terminal/ghostty.nix
    ./desktop/niri.nix
    ./programs/git.nix
    ./programs/browsers.nix
    ./programs/media.nix
    ./programs/dev.nix
  ];

  home.username = "arlecchino";
  home.homeDirectory = "/home/arlecchino";
  home.stateVersion = "26.05";

  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = 24;
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Kanagawa";
    };
  };

  home.packages = with pkgs; [
    antigravity-ide
  ];

  programs.home-manager.enable = true;
}
