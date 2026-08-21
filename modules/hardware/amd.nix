{ config, pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelParams = [
    "amd_pstate=active"
    "amdgpu.runpm=1"
    "pcie_aspm.policy=powersave"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
