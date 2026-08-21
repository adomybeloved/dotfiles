{ config, pkgs, ... }:

{
  boot.kernelParams = [
    "amd_pstate=active"
    "amdgpu.runpm=1"
    "pcie_aspm.policy=powersave"
    "mem_sleep_default=s2idle"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
