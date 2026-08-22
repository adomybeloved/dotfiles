{ config, pkgs, inputs, ... }:

let
  kanagawaUserChrome = ''
    :root {
      --toolbar-bgcolor: #1F1F28 !important;
      --tab-selected-bgcolor: #2A2A37 !important;
      --tab-selected-textcolor: #DCD7BA !important;
      --chrome-content-separator-color: #363646 !important;
      --toolbar-field-background-color: #16161D !important;
      --toolbar-field-color: #DCD7BA !important;
      --toolbar-field-focus-background-color: #1F1F28 !important;
      --toolbar-field-focus-color: #DCD7BA !important;
      --toolbar-field-border-color: #363646 !important;
      --toolbar-field-focus-border-color: #957FB8 !important;
      --focus-outline-color: #957FB8 !important;
      --lwt-accent-color: #1F1F28 !important;
      --lwt-text-color: #DCD7BA !important;
    }
    #navigator-toolbox {
      background-color: #1F1F28 !important;
      border-bottom: 1px solid #2A2A37 !important;
    }
    #urlbar-background {
      background-color: #16161D !important;
      border: 1px solid #363646 !important;
    }
    #urlbar[focused="true"] > #urlbar-background {
      border-color: #957FB8 !important;
    }
  '';

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
      "firefox@betterttv.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/betterttv/latest.xpi";
        installation_mode = "force_installed";
      };
      "firefox-extension@steamdb.info" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/steam-database/latest.xpi";
        installation_mode = "force_installed";
      };
    };
    Preferences = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
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
  ];

  programs.firefox = {
    enable = true;
    policies = sharedPolicies;
    profiles.default = {
      id = 0;
      isDefault = true;
      userChrome = kanagawaUserChrome;
    };
  };

  programs.zen-browser = {
    enable = true;
    policies = sharedPolicies;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
      "application/pdf" = "org.pwmt.zathura.desktop";
      "image/png" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "imv.desktop";
      "image/bmp" = "imv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/mkv" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";
      "audio/wav" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "inode/directory" = "yazi.desktop";
    };
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "zen";
    BROWSER = "zen";
  };
}
