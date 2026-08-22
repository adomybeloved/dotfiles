{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    defaultProfiles = [ "gpu-hq" ];
    config = {
      hwdec = "auto-safe";
      vo = "gpu-next";
      gpu-context = "wayland";
      keep-open = true;
      save-position-on-quit = true;
      autofit = "70%";
      slang = "ru,en";
      alang = "ja,en,ru";
    };
    scripts = with pkgs.mpvScripts; [
      mpris
      sponsorblock
      uosc
      thumbfast
    ];
  };

  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      recolor-keephue = true;
      default-bg = "#1F1F28";
      default-fg = "#DCD7BA";
      statusbar-bg = "#2A2A37";
      statusbar-fg = "#DCD7BA";
      inputbar-bg = "#1F1F28";
      inputbar-fg = "#DCD7BA";
      notification-bg = "#2A2A37";
      notification-fg = "#DCD7BA";
      notification-error-bg = "#E46876";
      notification-error-fg = "#1F1F28";
      notification-warning-bg = "#E6C384";
      notification-warning-fg = "#1F1F28";
      highlight-color = "rgba(149, 127, 184, 0.5)";
      highlight-active-color = "rgba(126, 156, 216, 0.5)";
      completion-bg = "#2A2A37";
      completion-fg = "#DCD7BA";
      completion-highlight-bg = "#957FB8";
      completion-highlight-fg = "#1F1F28";
      recolor-lightcolor = "#1F1F28";
      recolor-darkcolor = "#DCD7BA";
      render-loading = true;
      render-loading-bg = "#1F1F28";
      render-loading-fg = "#DCD7BA";
      selection-clipboard = "clipboard";
    };
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        savePathFixed = true;
        showStartupLaunchMessage = false;
        saveAfterCopy = true;
        copyPathAfterSave = false;
        disabledTrayIcon = false;
      };
    };
  };

  home.packages = with pkgs; [
    ayugram-desktop
    vesktop
    flameshot
    yt-dlp
    imv
    file-roller
    qalculate-gtk
    comma
    wl-clipboard
    brightnessctl
    grim
    slurp
    p7zip
    unzip
    ffmpegthumbnailer
    unar
    poppler-utils
  ];
}
