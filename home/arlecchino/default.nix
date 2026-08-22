{ config, pkgs, ... }:

{
  imports = [
    ../common
    ./desktop
  ];

  home.username = "arlecchino";
  home.homeDirectory = "/home/arlecchino";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    antigravity-ide
  ];
}
