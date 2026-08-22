{ config, pkgs, ... }:

{
  imports = [
    ./theme
    ./shell
    ./terminal/ghostty.nix
    ./programs/git.nix
    ./programs/browsers.nix
    ./programs/media.nix
    ./programs/dev.nix
  ];

  programs.home-manager.enable = true;
}
