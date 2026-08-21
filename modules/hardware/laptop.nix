{ config, pkgs, ... }:

{
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
