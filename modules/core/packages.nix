{ config, pkgs, ... }:

{
  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    htop
    pciutils
    usbutils
    dosfstools
    ntfs3g
    exfatprogs
    btrfs-progs
  ];
}
