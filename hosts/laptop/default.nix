{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/desktop/niri.nix
    ../../modules/hardware/amd.nix
    ../../modules/hardware/laptop.nix
    ../../modules/hardware/bluetooth.nix
  ];

  networking.hostName = "laptop";
}
