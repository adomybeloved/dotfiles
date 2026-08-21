{ config, pkgs, ... }:

{
  users.users.arlecchino = {
    isNormalUser = true;
    description = "Aleksandra Mironova";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };
}
