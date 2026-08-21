{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/desktop/plasma.nix
  ];

  networking.hostName = "laptop";

  services.libinput.enable = true;
}
