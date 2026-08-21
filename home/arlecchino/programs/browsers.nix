{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = false;
      DisableAccounts = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
    };
  };

  home.packages = [
    inputs.zen-browser.packages.${pkgs.system}.default
    inputs.helium-browser.packages.${pkgs.system}.default
  ];
}
