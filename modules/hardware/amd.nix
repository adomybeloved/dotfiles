{ config, pkgs, ... }:

{
  boot.kernelParams = [
    "amd_pstate=active"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
