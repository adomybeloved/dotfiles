{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Iosevka Nerd Font";
      font-size = 13;
      theme = "Kanagawa Wave";
      cursor-style = "block";
      cursor-style-blink = false;
      cursor-color = "#E6C384";
      selection-background = "#2D4F67";
      selection-foreground = "#DCD7BA";
      window-decoration = false;
      window-padding-x = 12;
      window-padding-y = 10;
      gtk-titlebar = false;
      confirm-close-surface = false;
      background-opacity = 0.95;
    };
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
