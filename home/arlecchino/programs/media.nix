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

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        savePath = "/home/arlecchino/Pictures/Screenshots";
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
    zathura
    file-roller
    qalculate-gtk
    comma
    wl-clipboard
    brightnessctl
    grim
    slurp
    p7zip
    unzip
  ];
}
