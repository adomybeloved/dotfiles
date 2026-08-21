{ config, pkgs, ... }:

{
  imports = [
    ./shell
    ./terminal/ghostty.nix
    ./desktop/plasma.nix
    ./desktop/niri.nix
    ./programs/git.nix
    ./programs/browsers.nix
    ./programs/media.nix
  ];

  home.username = "arlecchino";
  home.homeDirectory = "/home/arlecchino";
  home.stateVersion = "26.05";

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  home.packages = with pkgs; [
    antigravity-ide
    kdePackages.kate
  ];

  programs.home-manager.enable = true;
}
