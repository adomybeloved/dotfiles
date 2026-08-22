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
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      sarasa-gothic
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Iosevka Nerd Font" "Sarasa Mono J" "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
        sansSerif = [ "Inter" "Noto Sans CJK JP" "Noto Sans" "Roboto" "Noto Color Emoji" ];
        serif = [ "Noto Serif CJK JP" "Noto Serif" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
