{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.arlecchino = {
    isNormalUser = true;
    description = "Aleksandra Mironova";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "docker" "wireshark" ];
    shell = pkgs.zsh;
  };
}
