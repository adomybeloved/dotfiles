{ config, pkgs, ... }:

{
  imports = [
    ../common
    ./desktop/niri.nix
  ];

  home.username = "arlecchino";
  home.homeDirectory = "/home/arlecchino";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    antigravity-ide
  ];
}
