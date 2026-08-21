{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.arlecchino = {
    isNormalUser = true;
    description = "Aleksandra Mironova";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };
}
