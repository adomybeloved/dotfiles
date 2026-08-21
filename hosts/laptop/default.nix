{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/desktop/niri.nix
  ];

  networking.hostName = "laptop";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.power-profiles-daemon.enable = true;

  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
      accelProfile = "flat";
      accelSpeed = "0.2";
    };
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0.0";
    };
  };
}
