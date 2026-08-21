{ config, pkgs, lib, ... }:

{
  imports = [
    ./shell
    ./terminal/ghostty.nix
    ./programs/git.nix
    ./programs/browsers.nix
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
  };

  home.activation.setPlasmaTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    $DRY_RUN_CMD ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-lookandfeel -a Catppuccin-Mocha-Mauve 2>/dev/null || true
    $DRY_RUN_CMD ${pkgs.kdePackages.plasma-workspace}/bin/plasma-apply-colorscheme CatppuccinMochaMauve 2>/dev/null || true
  '';

  home.packages = with pkgs; [
    antigravity-ide
    kdePackages.kate
  ];

  programs.home-manager.enable = true;
}
