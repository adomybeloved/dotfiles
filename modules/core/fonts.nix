{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      iosevka
      inter
      roboto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Iosevka Nerd Font" "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Roboto" "Noto Sans" "Noto Color Emoji" ];
        serif = [ "Noto Serif" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
