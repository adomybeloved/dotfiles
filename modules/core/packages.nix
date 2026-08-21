{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    htop
    pciutils
    usbutils
  ];
}
