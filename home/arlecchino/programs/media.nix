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

  home.packages = with pkgs; [
    ayugram-desktop
    vesktop
    yt-dlp
    imv
    comma
    wl-clipboard
    brightnessctl
    kdePackages.okular
    kdePackages.ark
    kdePackages.spectacle
    kdePackages.kcalc
    p7zip
    unzip
  ];
}
