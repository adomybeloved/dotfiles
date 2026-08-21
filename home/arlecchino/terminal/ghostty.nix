{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      font-family = "Iosevka Nerd Font";
      font-size = 13;
      theme = "catppuccin-mocha";
      cursor-style = "block";
      cursor-style-blink = false;
      window-decoration = true;
      window-padding-x = 12;
      window-padding-y = 10;
      gtk-titlebar = false;
      confirm-close-surface = false;
    };
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
  };
}
