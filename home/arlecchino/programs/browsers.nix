{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
    inputs.helium-browser.homeModules.default
  ];

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

  programs.zen-browser = {
    enable = true;
  };

  programs.helium = {
    enable = true;
  };
}
