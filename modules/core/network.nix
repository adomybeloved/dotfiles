{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  boot.kernelModules = [ "tun" ];

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
