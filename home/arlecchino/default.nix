{ config, pkgs, ... }:

{
  imports = [
    ./shell
    ./terminal/ghostty.nix
    ./programs/git.nix
  ];

  home.username = "arlecchino";
  home.homeDirectory = "/home/arlecchino";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    antigravity-ide
    kdePackages.kate
    firefox
  ];

  programs.home-manager.enable = true;
}
