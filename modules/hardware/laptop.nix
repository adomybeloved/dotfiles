{ config, pkgs, ... }:

{
  boot.resumeDevice = "/dev/disk/by-uuid/b6dcf37b-7882-4f5c-b7b7-8d3ab7129092";

  services.power-profiles-daemon.enable = true;

  services.upower = {
    enable = true;
    percentageLow = 20;
    percentageCritical = 7;
    percentageAction = 5;
    criticalPowerAction = "Hibernate";
  };

  services.logind = {
    settings = {
      Login = {
        HandlePowerKey = "suspend-then-hibernate";
        HandleLidSwitch = "suspend-then-hibernate";
        HandleLidSwitchExternalPower = "suspend";
      };
    };
  };

  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "1h";
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", KERNEL=="BATT", ATTR{charge_control_end_threshold}="80"
  '';

  systemd.services.battery-charge-threshold = {
    description = "Set battery charge threshold to 80%";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'if [ -f /sys/class/power_supply/BATT/charge_control_end_threshold ]; then echo 80 > /sys/class/power_supply/BATT/charge_control_end_threshold; fi'";
    };
  };

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
