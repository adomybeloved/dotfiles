{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    maxGenerations = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [ "tcp_bbr" ];

  boot.kernelParams = [
    "transparent_hugepage=madvise"
    "split_lock_mitigate=0"
    "nowatchdog"
    "nmi_watchdog=0"
    "quiet"
    "loglevel=3"
    "rd.systemd.show_status=auto"
    "rd.udev.log_level=3"
  ];

  boot.kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
    "vm.page-cluster" = 0;
    "vm.dirty_bytes" = 268435456;
    "vm.dirty_background_bytes" = 134217728;
    "kernel.sched_cfs_bandwidth_slice_us" = 3000;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
  };

  services.fstrim.enable = true;
  services.btrfs.autoScrub.enable = true;
}
