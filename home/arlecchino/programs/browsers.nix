{ config, pkgs, inputs, ... }:

let
  sharedPolicies = {
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableFirefoxAccounts = false;
    DisableAccounts = false;
    OverrideFirstRunPage = "";
    OverridePostUpdatePage = "";
    DontCheckDefaultBrowser = true;
    OfferToSaveLogins = false;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
    ExtensionSettings = {
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
      };
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        installation_mode = "force_installed";
      };
      "addon@darkreader.org" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        installation_mode = "force_installed";
      };
      "sponsorBlocker@ajay.app" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        installation_mode = "force_installed";
      };
      "{762f9885-5a13-49d7-9570-70cb7e0d265e}" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislike/latest.xpi";
        installation_mode = "force_installed";
      };
    };
    Preferences = {
      "media.ffmpeg.vaapi.enabled" = true;
      "media.rdd-ffmpeg.enabled" = true;
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
      "browser.aboutConfig.showWarning" = false;
      "browser.compactmode.show" = true;
      "privacy.donottrackheader.enabled" = true;
      "signon.rememberSignons" = false;
      "general.smoothScroll" = true;
    };
  };
in
{
  imports = [
    inputs.zen-browser.homeModules.default
    inputs.helium-browser.homeModules.default
  ];

  programs.firefox = {
    enable = true;
    policies = sharedPolicies;
  };

  programs.zen-browser = {
    enable = true;
    policies = sharedPolicies;
  };

  programs.helium = {
    enable = true;
  };
}
